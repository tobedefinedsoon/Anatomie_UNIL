//
//  ContentView.swift
//  Anatomie UNIL
//
//  Created by Sven Borden on 22.09.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject private var settings = Settings()
    @StateObject private var statistics = Statistics()

    var body: some View {
        MainMenuView()
            .environmentObject(settings)
            .environmentObject(statistics)
            .onAppear {
                statistics.recordAppLaunch()
            }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Muscle.self, Quiz.self, QuizQuestion.self], inMemory: true)
}
