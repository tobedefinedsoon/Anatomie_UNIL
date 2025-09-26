//
//  QuizResultsView.swift
//  Anatomie UNIL
//
//  Created by Assistant on 22.09.2025.
//

import SwiftUI
import SwiftData
import MessageUI

struct QuizResultsView: View {
    let quiz: Quiz
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var statistics: Statistics
    @State private var showingMailComposer = false
    @State private var selectedQuestion: QuizQuestion?

    var body: some View {
        NavigationStack {
            ZStack {
                // Background gradient
                LinearGradient(
                    colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.4)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                ScrollView {
                VStack(spacing: 24) {
                    // Score header
                    VStack(spacing: 16) {
                        Text("Quiz terminé !")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        // Percentage circle
                        ZStack {
                            Circle()
                                .stroke(Color.gray.opacity(0.3), lineWidth: 8)
                                .frame(width: 120, height: 120)

                            Circle()
                                .trim(from: 0, to: quiz.percentageScore / 100)
                                .stroke(percentageColor, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                                .frame(width: 120, height: 120)
                                .rotationEffect(.degrees(-90))

                            VStack {
                                Text("\(Int(quiz.percentageScore))%")
                                    .font(.system(size: 28, weight: .bold))
                                    .foregroundColor(percentageColor)
                            }
                        }

                        VStack(spacing: 4) {
                            Text("\(quiz.score) / \(quiz.totalQuestions)")
                                .font(.title2)
                                .fontWeight(.semibold)

                            Text("\(Int(quiz.percentageScore))% de réussite")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }

                        if quiz.duration > 0 {
                            VStack(spacing: 4) {
                                Text("Temps total: \(formatDuration(quiz.duration))")
                                    .font(.caption)
                                    .foregroundColor(.secondary)

                                Text("Temps moyen par question: \(formatAverageTimePerQuestion())")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .padding(.top, 20)

                    // Questions review
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Révision des questions")
                            .font(.headline)
                            .padding(.horizontal, 20)

                        LazyVStack(spacing: 12) {
                            ForEach(Array(quiz.questions.enumerated()), id: \.offset) { index, question in
                                QuestionReviewCard(
                                    question: question,
                                    questionNumber: index + 1
                                ) {
                                    selectedQuestion = question
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }

                    // Action buttons
                    VStack(spacing: 16) {
                        Button("Nouveau quiz") {
                            dismiss()
                        }
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)

                        Button("Retour au menu") {
                            // Navigate back to main menu
                            dismiss()
                        }
                        .buttonStyle(.bordered)
                        .controlSize(.large)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                }
            }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Fermer") {
                        dismiss()
                    }
                }
            }
            .onAppear {
                statistics.recordQuizCompletion(quiz)
            }
        }
        .sheet(item: $selectedQuestion) { question in
            QuestionDetailView(question: question)
        }
    }

    private var percentageColor: Color {
        let percentage = quiz.percentageScore
        switch percentage {
        case 92...: return .green
        case 85..<92: return .blue
        case 72..<85: return .orange
        case 50..<72: return .yellow
        default: return .red
        }
    }

    private func formatDuration(_ duration: TimeInterval) -> String {
        let totalSeconds = Int(duration)
        let days = totalSeconds / 86400
        let hours = (totalSeconds % 86400) / 3600
        let minutes = (totalSeconds % 3600) / 60
        let seconds = totalSeconds % 60

        var components: [String] = []

        if days > 0 {
            components.append("\(days) jour\(days > 1 ? "s" : "")")
        }

        if hours > 0 {
            if hours == 1 {
                components.append("1 heure")
            } else {
                components.append("\(hours) heures")
            }
        }

        if minutes > 0 {
            if minutes == 1 {
                components.append("1 minute")
            } else {
                components.append("\(minutes) minutes")
            }
        }

        if seconds > 0 && days == 0 {
            if seconds == 1 {
                components.append("1 sec")
            } else {
                components.append("\(seconds) sec")
            }
        }

        if components.isEmpty {
            return "0 sec"
        }

        return components.joined(separator: ", ")
    }

    private func formatAverageTimePerQuestion() -> String {
        guard quiz.totalQuestions > 0 && quiz.duration > 0 else { return "0 sec" }

        let averageSeconds = quiz.duration / Double(quiz.totalQuestions)
        let averageMinutes = averageSeconds / 60.0

        if averageSeconds < 60 {
            return String(format: "%.0f sec", averageSeconds)
        } else if averageMinutes < 60 {
            return String(format: "%.1f min", averageMinutes)
        } else {
            let averageHours = averageMinutes / 60.0
            return String(format: "%.1f h", averageHours)
        }
    }
}

struct QuestionReviewCard: View {
    let question: QuizQuestion
    let questionNumber: Int
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 12) {
                // Question number and status
                ZStack {
                    Circle()
                        .fill(question.isCorrect ? Color.green : Color.red)
                        .frame(width: 30, height: 30)

                    Text("\(questionNumber)")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }

                // Question preview
                VStack(alignment: .leading, spacing: 4) {
                    Text(question.muscleName)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                        .lineLimit(1)

                    Text(question.questionType.rawValue)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
        }
        .buttonStyle(.plain)
    }
}

struct QuestionDetailView: View {
    let question: QuizQuestion
    @Environment(\.dismiss) private var dismiss
    @State private var showingMailComposer = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Question header
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Question")
                            .font(.headline)
                            .foregroundColor(.secondary)

                        Text(question.question)
                            .font(.title3)
                            .fontWeight(.medium)
                    }

                    // Answers section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Réponses")
                            .font(.headline)
                            .foregroundColor(.secondary)

                        VStack(alignment: .leading, spacing: 12) {
                            AnswerDetailRow(
                                title: "Votre réponse",
                                answer: question.userAnswer ?? "Non répondu",
                                isCorrect: question.isCorrect,
                                isUserAnswer: true
                            )

                            if question.userAnswer != question.correctAnswer {
                                AnswerDetailRow(
                                    title: "Réponse correcte",
                                    answer: question.correctAnswer,
                                    isCorrect: true,
                                    isUserAnswer: false
                                )
                            }
                        }
                    }

                    // Report error section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Une erreur ?")
                            .font(.headline)
                            .foregroundColor(.secondary)

                        Button("Signaler une erreur") {
                            if MFMailComposeViewController.canSendMail() {
                                showingMailComposer = true
                            }
                        }
                        .buttonStyle(.bordered)
                    }
                    .padding(.top, 20)
                }
                .padding(20)
            }
            .navigationTitle("Détail de la question")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Fermer") {
                        dismiss()
                    }
                }
            }
        }
        .sheet(isPresented: $showingMailComposer) {
            MailComposeView(
                toEmail: "sven.borden@outlook.com",
                subject: "Anatomie UNIL - Remarque sur une question",
                body: """
                Bonjour,

                Je souhaite signaler une remarque concernant cette question :

                Question : \(question.question)
                Réponse système : \(question.correctAnswer)
                Réponse utilisateur : \(question.userAnswer ?? "Non répondu")

                Remarque :
                """
            )
        }
    }
}

struct AnswerDetailRow: View {
    let title: String
    let answer: String
    let isCorrect: Bool
    let isUserAnswer: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.secondary)

            HStack {
                Text(answer)
                    .font(.body)
                    .foregroundColor(textColor)

                Spacer()

                Image(systemName: iconName)
                    .foregroundColor(iconColor)
            }
            .padding()
            .background(backgroundColor)
            .cornerRadius(8)
        }
    }

    private var textColor: Color {
        if isUserAnswer {
            return isCorrect ? .green : .red
        }
        return isCorrect ? .green : .primary
    }

    private var backgroundColor: Color {
        if isUserAnswer {
            return isCorrect ? .green.opacity(0.1) : .red.opacity(0.1)
        }
        return isCorrect ? .green.opacity(0.1) : Color(.systemGray6)
    }

    private var iconName: String {
        if isUserAnswer {
            return isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill"
        }
        return "checkmark.circle.fill"
    }

    private var iconColor: Color {
        if isUserAnswer {
            return isCorrect ? .green : .red
        }
        return .green
    }
}


#Preview {
    QuizResultsView(quiz: Quiz())
        .modelContainer(for: [Muscle.self, Quiz.self, QuizQuestion.self])
}