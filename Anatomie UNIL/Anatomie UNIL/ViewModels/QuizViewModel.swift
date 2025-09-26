//
//  QuizViewModel.swift
//  Anatomie UNIL
//
//  Created by Assistant on 22.09.2025.
//

import Foundation
import SwiftData
import SwiftUI

@Observable
class QuizViewModel {
    var currentQuiz: Quiz?
    var currentQuestionIndex: Int = 0
    var isQuizCompleted: Bool = false
    var selectedAnswer: String?
    var showingResults: Bool = false
    var quizStartTime: Date?
    var autoAdvanceCountdown: Int = 0
    var showNextButton: Bool = false
    var displayedQuestion: QuizQuestion? // The question currently displayed to the user
    var questionTimeRemaining: Int = 0
    private var countdownTimer: Timer?
    private var questionTimer: Timer?

    private let quizService: QuizService
    private let settings: Settings

    init(quizService: QuizService, settings: Settings) {
        self.quizService = quizService
        self.settings = settings
    }

    var currentQuestion: QuizQuestion? {
        // When showing results, display the question that was answered
        if showingResults, let displayed = displayedQuestion {
            return displayed
        }

        // Otherwise, display the current active question
        guard let quiz = currentQuiz,
              currentQuestionIndex < quiz.questions.count else { return nil }
        return quiz.questions[currentQuestionIndex]
    }

    var progress: Double {
        guard let quiz = currentQuiz, quiz.totalQuestions > 0 else { return 0 }
        return Double(currentQuestionIndex) / Double(quiz.totalQuestions)
    }

    var progressText: String {
        guard let quiz = currentQuiz else { return "" }
        return "\(currentQuestionIndex + 1) sur \(quiz.totalQuestions)"
    }

    func startQuiz(category: MuscleCategory?) {
        quizStartTime = Date()
        currentQuiz = quizService.createQuiz(category: category)
        currentQuestionIndex = 0
        isQuizCompleted = false
        selectedAnswer = nil
        showingResults = false
        displayedQuestion = nil
        startQuestionTimer()
    }

    func selectAnswer(_ answer: String) {
        selectedAnswer = answer

        if settings.showResultsImmediately {
            // Stop the question timer since user answered
            stopQuestionTimer()

            // Capture the current question before any changes
            guard let quiz = currentQuiz,
                  currentQuestionIndex < quiz.questions.count else { return }
            displayedQuestion = quiz.questions[currentQuestionIndex]

            // Submit immediately and show results when this setting is enabled
            submitAnswer()
            showingResults = true

            // Check if answer is correct
            if isAnswerCorrect == true {
                // Start 2-second countdown for correct answers
                startAutoAdvanceCountdown()
            } else {
                // Show next button for incorrect answers
                showNextButton = true
            }
        }
        // When showResultsImmediately is false, just select the answer
        // The user must click "Valider" to submit
    }

    func submitAnswer() {
        guard let question = currentQuestion,
              let answer = selectedAnswer else { return }

        // Stop the question timer since user submitted answer
        stopQuestionTimer()

        quizService.answerQuestion(question, with: answer)

        if !settings.showResultsImmediately {
            // Advance automatically to next question when results are not shown immediately
            nextQuestion()
        }
        // When showResultsImmediately is true, the result display logic is handled in selectAnswer()
    }

    private func nextQuestion() {
        stopCountdown()
        stopQuestionTimer()
        showNextButton = false
        showingResults = false

        if currentQuestionIndex < (currentQuiz?.questions.count ?? 0) - 1 {
            currentQuestionIndex += 1
            selectedAnswer = nil
            startQuestionTimer()
        } else {
            completeQuiz()
        }
    }

    func moveToNextQuestion() {
        // Clear the results display before moving to the next question
        showingResults = false
        showNextButton = false
        displayedQuestion = nil
        stopCountdown()

        // Then advance to the next question
        nextQuestion()
    }

    private func completeQuiz() {
        guard let quiz = currentQuiz, let startTime = quizStartTime else { return }

        quiz.duration = Date().timeIntervalSince(startTime)

        // Calculate final score
        quiz.score = quiz.questions.filter { $0.isCorrect }.count

        isQuizCompleted = true
        showingResults = true

        // Trigger haptic feedback if enabled
        if settings.hapticFeedback {
            let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
            impactFeedback.impactOccurred()
        }
    }

    func resetQuiz() {
        stopCountdown()
        stopQuestionTimer()
        currentQuiz = nil
        currentQuestionIndex = 0
        isQuizCompleted = false
        selectedAnswer = nil
        showingResults = false
        showNextButton = false
        autoAdvanceCountdown = 0
        questionTimeRemaining = 0
        quizStartTime = nil
        displayedQuestion = nil
    }

    var isAnswerCorrect: Bool? {
        guard let question = currentQuestion,
              let answer = selectedAnswer else { return nil }
        return question.correctAnswer == answer
    }

    func getQuizHistory() -> [Quiz] {
        return quizService.getQuizHistory()
    }

    private func startAutoAdvanceCountdown() {
        autoAdvanceCountdown = 3
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.autoAdvanceCountdown -= 1

            if self.autoAdvanceCountdown < 0 {
                // Add a small delay after showing 0 before advancing
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.moveToNextQuestion()
                }
                self.stopCountdown()
            }
        }
    }

    private func stopCountdown() {
        countdownTimer?.invalidate()
        countdownTimer = nil
        autoAdvanceCountdown = 0
    }

    private func startQuestionTimer() {
        questionTimeRemaining = settings.timePerQuestion
        questionTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.questionTimeRemaining -= 1

            if self.questionTimeRemaining <= 0 {
                self.handleQuestionTimeout()
            }
        }
    }

    private func stopQuestionTimer() {
        questionTimer?.invalidate()
        questionTimer = nil
        questionTimeRemaining = 0
    }

    private func handleQuestionTimeout() {
        stopQuestionTimer()

        // If no answer was selected, mark as incorrect and move to next question
        if selectedAnswer == nil {
            // Mark question as timed out (incorrect)
            if let question = currentQuestion {
                quizService.answerQuestion(question, with: "")
            }
            nextQuestion()
        } else if !showingResults {
            // If answer was selected but not submitted, submit it
            submitAnswer()
        }
    }

    var questionProgress: Double {
        guard settings.timePerQuestion > 0 else { return 0 }
        return Double(settings.timePerQuestion - questionTimeRemaining) / Double(settings.timePerQuestion)
    }
}