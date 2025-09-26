//
//  Anatomie_UNILTests.swift
//  Anatomie UNILTests
//
//  Created by Sven Borden on 22.09.2025.
//

import XCTest
import SwiftData
@testable import Anatomie_UNIL

final class Anatomie_UNILTests: XCTestCase {
    var modelContainer: ModelContainer!
    var modelContext: ModelContext!
    var settings: Settings!
    var quizService: QuizService!

    override func setUpWithError() throws {
        // Create in-memory model container for testing
        let schema = Schema([Muscle.self, Quiz.self, QuizQuestion.self])
        let configuration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        modelContainer = try ModelContainer(for: schema, configurations: [configuration])
        modelContext = ModelContext(modelContainer)

        // Create test settings
        settings = Settings()
        settings.questionCount = 5
        settings.enableOrigin = true
        settings.enableInsertion = true
        settings.enableInnervation = false
        settings.enableVascularization = false

        // Create quiz service
        quizService = QuizService(modelContext: modelContext, settings: settings)
    }

    override func tearDownWithError() throws {
        modelContainer = nil
        modelContext = nil
        settings = nil
        quizService = nil
    }

    // MARK: - Model Tests

    func testMuscleCreation() throws {
        let muscle = Muscle(
            name: "Test Muscle",
            origin: "Test Origin",
            insertion: "Test Insertion",
            innervation: "Test Nerve",
            vascularization: "Test Artery",
            category: .upperLimb,
            subcategory: .arm
        )

        XCTAssertEqual(muscle.name, "Test Muscle")
        XCTAssertEqual(muscle.category, .upperLimb)
        XCTAssertEqual(muscle.subcategory, .arm)
        XCTAssertNotNil(muscle.id)
    }

    func testQuizCreation() throws {
        let quiz = Quiz(category: .upperLimb)

        XCTAssertEqual(quiz.category, .upperLimb)
        XCTAssertEqual(quiz.score, 0)
        XCTAssertEqual(quiz.totalQuestions, 0)
        XCTAssertTrue(quiz.questions.isEmpty)
        XCTAssertNotNil(quiz.id)
    }

    func testQuizPercentageCalculation() throws {
        let quiz = Quiz()
        quiz.score = 15
        quiz.totalQuestions = 20

        XCTAssertEqual(quiz.percentageScore, 75.0)
    }

    func testQuestionTypeAnswers() throws {
        let muscle = Muscle(
            name: "Test Muscle",
            origin: "Test Origin",
            insertion: "Test Insertion",
            innervation: "Test Nerve",
            vascularization: "Test Artery",
            category: .upperLimb,
            subcategory: .arm
        )

        XCTAssertEqual(QuestionType.origin.correctAnswer(for: muscle), "Test Origin")
        XCTAssertEqual(QuestionType.insertion.correctAnswer(for: muscle), "Test Insertion")
        XCTAssertEqual(QuestionType.innervation.correctAnswer(for: muscle), "Test Nerve")
        XCTAssertEqual(QuestionType.vascularization.correctAnswer(for: muscle), "Test Artery")
    }

    // MARK: - Settings Tests

    func testSettingsEnabledQuestionTypes() throws {
        settings.enableOrigin = true
        settings.enableInsertion = false
        settings.enableInnervation = true
        settings.enableVascularization = false

        let enabledTypes = settings.enabledQuestionTypes
        XCTAssertEqual(enabledTypes.count, 2)
        XCTAssertTrue(enabledTypes.contains(.origin))
        XCTAssertTrue(enabledTypes.contains(.innervation))
        XCTAssertFalse(enabledTypes.contains(.insertion))
        XCTAssertFalse(enabledTypes.contains(.vascularization))
    }

    func testSettingsMinimumOneType() throws {
        settings.enableOrigin = false
        settings.enableInsertion = false
        settings.enableInnervation = false
        settings.enableVascularization = false

        let enabledTypes = settings.enabledQuestionTypes
        XCTAssertEqual(enabledTypes.count, 1)
        XCTAssertTrue(enabledTypes.contains(.origin))
    }

    // MARK: - Quiz Service Tests

    func testMusclesDatabaseLoading() throws {
        let muscles = MuscleDatabase.getAllMuscles()
        XCTAssertGreaterThan(muscles.count, 100) // Should have over 100 muscles

        // Test specific muscle categories
        let upperLimbMuscles = muscles.filter { $0.category == .upperLimb }
        let lowerLimbMuscles = muscles.filter { $0.category == .lowerLimb }
        let trunkMuscles = muscles.filter { $0.category == .trunk }

        XCTAssertGreaterThan(upperLimbMuscles.count, 0)
        XCTAssertGreaterThan(lowerLimbMuscles.count, 0)
        XCTAssertGreaterThan(trunkMuscles.count, 0)
    }

    func testQuizGeneration() throws {
        let quiz = quizService.createQuiz(category: .upperLimb)

        XCTAssertNotNil(quiz)
        XCTAssertEqual(quiz.category, .upperLimb)
        XCTAssertEqual(quiz.questions.count, settings.questionCount)
        XCTAssertEqual(quiz.totalQuestions, settings.questionCount)

        // Test that all questions have valid options
        for question in quiz.questions {
            XCTAssertEqual(question.options.count, 4)
            XCTAssertTrue(question.options.contains(question.correctAnswer))
            XCTAssertFalse(question.question.isEmpty)
            XCTAssertFalse(question.correctAnswer.isEmpty)
        }
    }

    func testQuizAnswering() throws {
        let quiz = quizService.createQuiz(category: nil)
        guard let firstQuestion = quiz.questions.first else {
            XCTFail("Quiz should have questions")
            return
        }

        let correctAnswer = firstQuestion.correctAnswer
        quizService.answerQuestion(firstQuestion, with: correctAnswer)

        XCTAssertEqual(firstQuestion.userAnswer, correctAnswer)
        XCTAssertTrue(firstQuestion.isCorrect)
        XCTAssertNotNil(firstQuestion.answeredAt)
    }

    // MARK: - Performance Tests

    func testQuizGenerationPerformance() throws {
        measure {
            _ = quizService.createQuiz(category: .upperLimb)
        }
    }

    func testMuscleDataLoadingPerformance() throws {
        measure {
            _ = MuscleDatabase.getAllMuscles()
        }
    }
}
