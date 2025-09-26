//
//  SettingsView.swift
//  Anatomie UNIL
//
//  Created by Assistant on 22.09.2025.
//

import SwiftUI
import MessageUI

struct SettingsView: View {
    @EnvironmentObject private var settings: Settings
    @EnvironmentObject private var statistics: Statistics
    @Environment(\.dismiss) private var dismiss
    @State private var showingMailComposer = false

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
                        ), in: 5...50, step: 5)
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

                Section("Temps par question") {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Temps: \(settings.timePerQuestion) secondes")
                                .font(.headline)
                            Spacer()
                        }

                        Slider(value: Binding(
                            get: { Double(settings.timePerQuestion) },
                            set: { settings.timePerQuestion = Int($0) }
                        ), in: 10...60, step: 5)
                        .tint(.blue)

                        HStack {
                            Text("10s")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Spacer()
                            Text("60s")
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

                Section("Support") {
                    Button(action: {
                        if MFMailComposeViewController.canSendMail() {
                            showingMailComposer = true
                        } else {
                            // Fallback to mailto URL
                            let email = "sven.borden@outlook.com"
                            let subject = "Anatomie UNIL - Suggestion/Correction"
                            let body = "Bonjour,\n\nJe souhaite faire part d'une suggestion ou d'une correction,\n\n"

                            let encodedSubject = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                            let encodedBody = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

                            if let url = URL(string: "mailto:\(email)?subject=\(encodedSubject)&body=\(encodedBody)") {
                                UIApplication.shared.open(url)
                            }
                        }
                    }) {
                        HStack {
                            Image(systemName: "envelope")
                            Text("Contacter le développeur")
                        }
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
            .sheet(isPresented: $showingMailComposer) {
                MailComposeView(
                    toEmail: "sven.borden@outlook.com",
                    subject: "Anatomie UNIL - Suggestion/Correction",
                    body: "Bonjour,\n\nJe souhaite faire part d'une suggestion ou d'une correction,\n\n"
                )
            }
        }
    }
}

struct MailComposeView: UIViewControllerRepresentable {
    let toEmail: String
    let subject: String
    let body: String

    @Environment(\.dismiss) private var dismiss

    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = context.coordinator
        composer.setToRecipients([toEmail])
        composer.setSubject(subject)
        composer.setMessageBody(body, isHTML: false)
        return composer
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {
        // No updates needed
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        let parent: MailComposeView

        init(_ parent: MailComposeView) {
            self.parent = parent
        }

        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            parent.dismiss()
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(Settings())
}