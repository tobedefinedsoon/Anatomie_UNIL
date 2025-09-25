//
//  QuizService.swift
//  Anatomie UNIL
//
//  Created by Assistant on 22.09.2025.
//

import Foundation
import SwiftData

@Observable
class QuizService {
    private let modelContext: ModelContext
    private let settings: Settings
    private var allMuscles: [Muscle] = []

    init(modelContext: ModelContext, settings: Settings) {
        self.modelContext = modelContext
        self.settings = settings
        loadMuscles()
    }

    private func loadMuscles() {
        // Try to load from SwiftData first
        let descriptor = FetchDescriptor<Muscle>()
        do {
            allMuscles = try modelContext.fetch(descriptor)
            if allMuscles.isEmpty {
                // If no muscles in database, populate from static data
                populateInitialData()
            }
        } catch {
            print("Error loading muscles: \(error)")
            populateInitialData()
        }
    }

    private func populateInitialData() {
        allMuscles = MuscleDatabase.getAllMuscles()

        // Save muscles to SwiftData
        for muscle in allMuscles {
            modelContext.insert(muscle)
        }

        do {
            try modelContext.save()
        } catch {
            print("Error saving muscles: \(error)")
        }
    }

    func createQuiz(category: MuscleCategory?) -> Quiz {
        let quiz = Quiz(category: category)

        // Filter muscles based on category
        let filteredMuscles = category == nil ? allMuscles : allMuscles.filter { $0.category == category }

        // Generate questions
        let questions = generateQuestions(from: filteredMuscles, count: settings.questionCount)
        quiz.questions = questions
        quiz.totalQuestions = questions.count

        // Save quiz to SwiftData
        modelContext.insert(quiz)

        return quiz
    }

    private func generateQuestions(from muscles: [Muscle], count: Int) -> [QuizQuestion] {
        var questions: [QuizQuestion] = []
        var usedMuscles: Set<UUID> = []
        let enabledTypes = settings.enabledQuestionTypes

        guard !enabledTypes.isEmpty && !muscles.isEmpty else { return [] }

        for _ in 0..<count {
            // Try to find a muscle that hasn't been used yet
            var attempts = 0
            var selectedMuscle: Muscle?

            while attempts < 50 && selectedMuscle == nil {
                let randomMuscle = muscles.randomElement()!
                if !usedMuscles.contains(randomMuscle.id) {
                    selectedMuscle = randomMuscle
                    usedMuscles.insert(randomMuscle.id)
                } else if usedMuscles.count >= muscles.count {
                    // If we've used all muscles, reset and allow reuse
                    usedMuscles.removeAll()
                    selectedMuscle = randomMuscle
                    usedMuscles.insert(randomMuscle.id)
                }
                attempts += 1
            }

            guard let muscle = selectedMuscle else { continue }

            // Select random question type from enabled types
            let questionType = enabledTypes.randomElement()!

            // Generate answer options
            let options = generateOptions(for: muscle, questionType: questionType, from: muscles)

            let question = QuizQuestion(muscle: muscle, questionType: questionType, options: options)
            questions.append(question)
        }

        return questions
    }

    private func generateOptions(for targetMuscle: Muscle, questionType: QuestionType, from allMuscles: [Muscle]) -> [String] {
        let correctAnswer = questionType.correctAnswer(for: targetMuscle)
        var options = [correctAnswer]

        // Generate 3 incorrect options
        var attempts = 0
        while options.count < 4 && attempts < 100 {
            let randomMuscle = allMuscles.randomElement()!
            let possibleAnswer = questionType.correctAnswer(for: randomMuscle)

            if !options.contains(possibleAnswer) && !possibleAnswer.isEmpty {
                options.append(possibleAnswer)
            }
            attempts += 1
        }

        // Fill with default options if needed
        while options.count < 4 {
            options.append("Option \(options.count)")
        }

        // Shuffle the options
        return options.shuffled()
    }

    func answerQuestion(_ question: QuizQuestion, with answer: String) {
        question.answer(answer)

        // Always update quiz score after answering (regardless of correct/incorrect)
        updateQuizScore(for: question)

        do {
            try modelContext.save()
        } catch {
            print("Error saving answer: \(error)")
        }
    }

    private func updateQuizScore(for question: QuizQuestion) {
        let descriptor = FetchDescriptor<Quiz>()
        do {
            let quizzes = try modelContext.fetch(descriptor)
            if let quiz = quizzes.first(where: { $0.questions.contains { $0.id == question.id } }) {
                quiz.score = quiz.questions.filter { $0.isCorrect }.count
            }
        } catch {
            print("Error updating quiz score: \(error)")
        }
    }

    func getQuizHistory() -> [Quiz] {
        let descriptor = FetchDescriptor<Quiz>(sortBy: [SortDescriptor(\.date, order: .reverse)])
        do {
            return try modelContext.fetch(descriptor)
        } catch {
            print("Error fetching quiz history: \(error)")
            return []
        }
    }

    func deleteQuiz(_ quiz: Quiz) {
        modelContext.delete(quiz)
        do {
            try modelContext.save()
        } catch {
            print("Error deleting quiz: \(error)")
        }
    }
}