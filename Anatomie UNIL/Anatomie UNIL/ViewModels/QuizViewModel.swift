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
    private var countdownTimer: Timer?

    private let quizService: QuizService
    private let settings: Settings

    init(quizService: QuizService, settings: Settings) {
        self.quizService = quizService
        self.settings = settings
    }

    var currentQuestion: QuizQuestion? {
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
    }

    func selectAnswer(_ answer: String) {
        selectedAnswer = answer

        // Always submit the answer immediately when selected
        submitAnswer()

        if settings.showResultsImmediately {
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
    }

    func submitAnswer() {
        guard let question = currentQuestion,
              let answer = selectedAnswer else { return }

        quizService.answerQuestion(question, with: answer)

        // Only advance automatically if results are not shown immediately
        // When showResultsImmediately is true, progression is handled by countdown/next button
        if !settings.showResultsImmediately {
            nextQuestion()
        }
    }

    private func nextQuestion() {
        stopCountdown()
        showNextButton = false
        showingResults = false

        if currentQuestionIndex < (currentQuiz?.questions.count ?? 0) - 1 {
            currentQuestionIndex += 1
            selectedAnswer = nil
        } else {
            completeQuiz()
        }
    }

    func moveToNextQuestion() {
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
        currentQuiz = nil
        currentQuestionIndex = 0
        isQuizCompleted = false
        selectedAnswer = nil
        showingResults = false
        showNextButton = false
        autoAdvanceCountdown = 0
        quizStartTime = nil
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
                    self.nextQuestion()
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
}