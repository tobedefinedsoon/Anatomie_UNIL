//
//  HistoryView.swift
//  Anatomie UNIL
//
//  Created by Assistant on 22.09.2025.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Query(sort: \Quiz.date, order: .reverse) private var quizzes: [Quiz]

    var body: some View {
        NavigationStack {
            Group {
                if quizzes.isEmpty {
                    ContentUnavailableView(
                        "Aucun historique",
                        systemImage: "clock.arrow.circlepath",
                        description: Text("Vos quiz précédents apparaîtront ici")
                    )
                } else {
                    List {
                        ForEach(quizzes, id: \.id) { quiz in
                            QuizHistoryRow(quiz: quiz)
                        }
                        .onDelete(perform: deleteQuizzes)
                    }
                }
            }
            .navigationTitle("Historique")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if !quizzes.isEmpty {
                        EditButton()
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Fermer") {
                        dismiss()
                    }
                }
            }
        }
    }

    private func deleteQuizzes(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(quizzes[index])
            }
        }
    }
}

struct QuizHistoryRow: View {
    let quiz: Quiz
    @State private var showingDetails = false

    var body: some View {
        Button(action: { showingDetails = true }) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(quiz.category?.rawValue ?? "Toutes les catégories")
                        .font(.headline)
                        .foregroundColor(.primary)

                    Text(formatDate(quiz.date))
                        .font(.caption)
                        .foregroundColor(.secondary)

                    HStack(spacing: 12) {
                        Label("\(quiz.score)/\(quiz.totalQuestions)", systemImage: "checkmark.circle")
                            .font(.caption)
                            .foregroundColor(.secondary)

                        if quiz.duration > 0 {
                            Label(formatDuration(quiz.duration), systemImage: "clock")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 4) {
                    ZStack {
                        Circle()
                            .fill(percentageColor.opacity(0.2))
                            .frame(width: 50, height: 50)

                        Text("\(Int(quiz.percentageScore))%")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(percentageColor)
                    }

                    Text("\(quiz.score)/\(quiz.totalQuestions)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.vertical, 4)
        }
        .buttonStyle(.plain)
        .sheet(isPresented: $showingDetails) {
            QuizResultsView(quiz: quiz)
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

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter.string(from: date)
    }

    private func formatDuration(_ duration: TimeInterval) -> String {
        let minutes = Int(duration) / 60
        let seconds = Int(duration) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}

#Preview {
    HistoryView()
        .modelContainer(for: [Muscle.self, Quiz.self, QuizQuestion.self])
}