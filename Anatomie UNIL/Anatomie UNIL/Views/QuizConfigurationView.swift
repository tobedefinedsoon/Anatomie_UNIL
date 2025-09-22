//
//  QuizConfigurationView.swift
//  Anatomie UNIL
//
//  Created by Assistant on 22.09.2025.
//

import SwiftUI
import SwiftData

struct QuizConfigurationView: View {
    let category: MuscleCategory?

    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject private var settings: Settings
    @Environment(\.dismiss) private var dismiss

    @State private var startQuiz = false

    var body: some View {
        NavigationStack {
            Form {
                Section("Catégorie") {
                    HStack {
                        Image(systemName: categoryIcon)
                            .foregroundColor(.blue)
                        Text(categoryTitle)
                            .font(.headline)
                    }
                }

                Section("Nombre de questions") {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Questions: \(settings.questionCount)")
                                .font(.headline)
                            Spacer()
                        }

                        Slider(value: Binding(
                            get: { Double(settings.questionCount) },
                            set: { settings.questionCount = Int($0) }
                        ), in: 5...50, step: 1)
                        .tint(.blue)

                        HStack {
                            Text("5")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Spacer()
                            Text("50")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 4)
                }

                Section("Types de questions") {
                    Toggle("Origine", isOn: $settings.enableOrigin)
                    Toggle("Terminaison", isOn: $settings.enableInsertion)
                    Toggle("Innervation", isOn: $settings.enableInnervation)
                    Toggle("Vascularisation", isOn: $settings.enableVascularization)
                }

                Section("Options") {
                    Toggle("Afficher les résultats immédiatement", isOn: $settings.showResultsImmediately)
                    Toggle("Retour haptique", isOn: $settings.hapticFeedback)
                }
            }
            .navigationTitle("Configuration")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Annuler") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Commencer") {
                        startQuiz = true
                    }
                    .fontWeight(.semibold)
                    .disabled(!hasValidConfiguration)
                }
            }
        }
        .fullScreenCover(isPresented: $startQuiz) {
            QuizView(category: category)
        }
    }

    private var categoryTitle: String {
        category?.rawValue ?? "Toutes les catégories"
    }

    private var categoryIcon: String {
        switch category {
        case .upperLimb:
            return "hand.raised.fill"
        case .lowerLimb:
            return "figure.walk"
        case .trunk:
            return "person.fill"
        case .none:
            return "globe"
        }
    }

    private var hasValidConfiguration: Bool {
        settings.enabledQuestionTypes.count > 0 && settings.questionCount > 0
    }
}

#Preview {
    QuizConfigurationView(category: .upperLimb)
        .environmentObject(Settings())
        .modelContainer(for: [Muscle.self, Quiz.self, QuizQuestion.self])
}