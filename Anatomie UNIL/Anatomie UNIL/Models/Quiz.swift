//
//  Quiz.swift
//  Anatomie UNIL
//
//  Created by Assistant on 22.09.2025.
//

import Foundation
import SwiftData

@Model
final class Quiz {
    var id: UUID
    var date: Date
    var category: MuscleCategory?
    var score: Int
    var totalQuestions: Int
    var questions: [QuizQuestion]
    var duration: TimeInterval

    init(category: MuscleCategory? = nil) {
        self.id = UUID()
        self.date = Date()
        self.category = category
        self.score = 0
        self.totalQuestions = 0
        self.questions = []
        self.duration = 0
    }

    var percentageScore: Double {
        guard totalQuestions > 0 else { return 0 }
        return (Double(score) / Double(totalQuestions)) * 100
    }

    var grade: Int {
        let percentage = percentageScore
        switch percentage {
        case 92...: return 6
        case 85..<92: return 5
        case 72..<85: return 4
        case 50..<72: return 3
        case 30..<50: return 2
        default: return 1
        }
    }
}

@Model
final class QuizQuestion {
    var id: UUID
    var muscleId: UUID
    var muscleName: String
    var questionType: QuestionType
    var question: String
    var correctAnswer: String
    var options: [String]
    var userAnswer: String?
    var isCorrect: Bool
    var answeredAt: Date?

    init(
        muscle: Muscle,
        questionType: QuestionType,
        options: [String]
    ) {
        self.id = UUID()
        self.muscleId = muscle.id
        self.muscleName = muscle.name
        self.questionType = questionType
        self.question = questionType.questionText(for: muscle.name)
        self.correctAnswer = questionType.correctAnswer(for: muscle)
        self.options = options
        self.userAnswer = nil
        self.isCorrect = false
        self.answeredAt = nil
    }

    func answer(_ answer: String) {
        self.userAnswer = answer
        // Trim whitespace and compare case-insensitively to handle potential string issues
        let trimmedAnswer = answer.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedCorrect = correctAnswer.trimmingCharacters(in: .whitespacesAndNewlines)
        self.isCorrect = trimmedAnswer.lowercased() == trimmedCorrect.lowercased()
        self.answeredAt = Date()
    }
}

enum QuestionType: String, CaseIterable, Codable {
    case origin = "Origine"
    case insertion = "Terminaison"
    case innervation = "Innervation"
    case vascularization = "Vascularisation"

    func questionText(for muscleName: String) -> String {
        switch self {
        case .origin:
            return "Quelle est l'origine du \(muscleName)?"
        case .insertion:
            return "Quelle est la terminaison du \(muscleName)?"
        case .innervation:
            return "Quelle est l'innervation du \(muscleName)?"
        case .vascularization:
            return "Quelle est la vascularisation du \(muscleName)?"
        }
    }

    func correctAnswer(for muscle: Muscle) -> String {
        switch self {
        case .origin:
            return muscle.origin
        case .insertion:
            return muscle.insertion
        case .innervation:
            return muscle.innervation
        case .vascularization:
            return muscle.vascularization
        }
    }
}