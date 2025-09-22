//
//  Anatomie_UNILApp.swift
//  Anatomie UNIL
//
//  Created by Sven Borden on 22.09.2025.
//

import SwiftUI
import SwiftData

@main
struct Anatomie_UNILApp: App {
    let settings = Settings()
    let statistics = Statistics()

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Muscle.self,
            Quiz.self,
            QuizQuestion.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainMenuView()
                .environmentObject(settings)
                .environmentObject(statistics)
                .onAppear {
                    statistics.recordAppLaunch()
                }
        }
        .modelContainer(sharedModelContainer)
    }
}
