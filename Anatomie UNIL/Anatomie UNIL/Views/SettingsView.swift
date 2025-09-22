//
//  SettingsView.swift
//  Anatomie UNIL
//
//  Created by Assistant on 22.09.2025.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var settings: Settings
    @EnvironmentObject private var statistics: Statistics
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            Form {
                Section("Questions par défaut") {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Nombre de questions: \(settings.questionCount)")
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

                Section("Types de questions par défaut") {
                    Toggle("Origine", isOn: $settings.enableOrigin)
                    Toggle("Terminaison", isOn: $settings.enableInsertion)
                    Toggle("Innervation", isOn: $settings.enableInnervation)
                    Toggle("Vascularisation", isOn: $settings.enableVascularization)
                }

                Section("Interface") {
                    Toggle("Afficher les résultats immédiatement", isOn: $settings.showResultsImmediately)
                    Toggle("Retour haptique", isOn: $settings.hapticFeedback)
                }

                Section("Statistiques") {
                    HStack {
                        Text("Questions répondues")
                        Spacer()
                        Text("\(statistics.totalQuestionsAnswered)")
                            .foregroundColor(.secondary)
                    }

                    HStack {
                        Text("Taux de réussite")
                        Spacer()
                        Text(statistics.formattedSuccessRate)
                            .foregroundColor(.secondary)
                    }

                    HStack {
                        Text("Lancements de l'app")
                        Spacer()
                        Text("\(statistics.appLaunchCount)")
                            .foregroundColor(.secondary)
                    }
                }

                Section("À propos") {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.secondary)
                    }

                    HStack {
                        Text("Développé pour")
                        Spacer()
                        Text("UNIL")
                            .foregroundColor(.secondary)
                    }
                }

                Section {
                    Button("Réinitialiser les paramètres", role: .destructive) {
                        settings.reset()
                    }
                }
            }
            .navigationTitle("Réglages")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Fermer") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(Settings())
}