//
//  MainMenuView.swift
//  Anatomie UNIL
//
//  Created by Assistant on 22.09.2025.
//

import SwiftUI
import SwiftData

struct MainMenuView: View {
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject private var settings: Settings
    @State private var showingSettings = false
    @State private var showingHistory = false

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

                VStack(spacing: 30) {
                    // Header
                    VStack(spacing: 10) {
                        Image(systemName: "brain.head.profile")
                            .font(.system(size: 60))
                            .foregroundColor(.white)

                        Text("Anatomie UNIL")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        Text("Quiz d'anatomie musculaire")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(.top, 40)

                    Spacer()

                    // Quiz category buttons
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 15),
                        GridItem(.flexible(), spacing: 15)
                    ], spacing: 20) {
                        CategoryButton(
                            title: "Membre supérieur",
                            icon: "hand.raised.fill",
                            category: .upperLimb
                        )

                        CategoryButton(
                            title: "Membre inférieur",
                            icon: "figure.walk",
                            category: .lowerLimb
                        )

                        CategoryButton(
                            title: "Tronc",
                            icon: "person.fill",
                            category: .trunk
                        )

                        CategoryButton(
                            title: "Tout",
                            icon: "globe",
                            category: nil
                        )
                    }
                    .padding(.horizontal, 30)

                    Spacer()

                    // Bottom buttons
                    HStack(spacing: 20) {
                        Button(action: { showingHistory = true }) {
                            HStack {
                                Image(systemName: "clock.arrow.circlepath")
                                Text("Historique")
                            }
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(10)
                        }

                        Spacer()

                        Button(action: { showingSettings = true }) {
                            HStack {
                                Image(systemName: "gear")
                                Text("Réglages")
                            }
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 30)
                }
            }
        }
        .sheet(isPresented: $showingSettings) {
            SettingsView()
        }
        .sheet(isPresented: $showingHistory) {
            HistoryView()
        }
    }
}

struct CategoryButton: View {
    let title: String
    let icon: String
    let category: MuscleCategory?

    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject private var settings: Settings

    var body: some View {
        NavigationLink(destination: QuizView(category: category)) {
            VStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.title)
                    .frame(height: 30)

                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)

                Image(systemName: "chevron.right")
                    .font(.caption2)
                    .opacity(0.6)
            }
            .foregroundColor(.primary)
            .padding()
            .frame(maxWidth: .infinity, minHeight: 100)
            .background(Color.white.opacity(0.9))
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
        }
    }
}

#Preview {
    MainMenuView()
        .environmentObject(Settings())
        .modelContainer(for: [Muscle.self, Quiz.self, QuizQuestion.self])
}