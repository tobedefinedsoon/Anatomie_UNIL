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
    }

    func submitAnswer() {
        guard let question = currentQuestion,
              let answer = selectedAnswer else { return }

        quizService.answerQuestion(question, with: answer)

        if settings.showResultsImmediately {
            // Show feedback briefly, then move to next question
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.nextQuestion()
            }
        } else {
            nextQuestion()
        }
    }

    private func nextQuestion() {
        if currentQuestionIndex < (currentQuiz?.questions.count ?? 0) - 1 {
            currentQuestionIndex += 1
            selectedAnswer = nil
        } else {
            completeQuiz()
        }
    }

    private func completeQuiz() {
        guard let quiz = currentQuiz, let startTime = quizStartTime else { return }

        quiz.duration = Date().timeIntervalSince(startTime)
        isQuizCompleted = true
        showingResults = true

        // Trigger haptic feedback if enabled
        if settings.hapticFeedback {
            let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
            impactFeedback.impactOccurred()
        }
    }

    func resetQuiz() {
        currentQuiz = nil
        currentQuestionIndex = 0
        isQuizCompleted = false
        selectedAnswer = nil
        showingResults = false
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
}