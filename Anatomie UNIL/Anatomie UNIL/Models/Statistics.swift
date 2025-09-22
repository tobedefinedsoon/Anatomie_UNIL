//
//  Statistics.swift
//  Anatomie UNIL
//
//  Created by Assistant on 22.09.2025.
//

import Foundation
import SwiftUI

class Statistics: ObservableObject {
    @AppStorage("totalQuestionsAnswered") var totalQuestionsAnswered: Int = 0
    @AppStorage("totalCorrectAnswers") var totalCorrectAnswers: Int = 0
    @AppStorage("totalIncorrectAnswers") var totalIncorrectAnswers: Int = 0
    @AppStorage("appLaunchCount") var appLaunchCount: Int = 0
    @AppStorage("lastLaunchDate") var lastLaunchDate: Double = 0

    var successRate: Double {
        guard totalQuestionsAnswered > 0 else { return 0 }
        return (Double(totalCorrectAnswers) / Double(totalQuestionsAnswered)) * 100
    }

    var formattedSuccessRate: String {
        return String(format: "%.1f%%", successRate)
    }

    func recordQuizCompletion(_ quiz: Quiz) {
        totalQuestionsAnswered += quiz.totalQuestions
        totalCorrectAnswers += quiz.score
        totalIncorrectAnswers += (quiz.totalQuestions - quiz.score)
    }

    func recordAppLaunch() {
        appLaunchCount += 1
        lastLaunchDate = Date().timeIntervalSince1970
    }

    func reset() {
        totalQuestionsAnswered = 0
        totalCorrectAnswers = 0
        totalIncorrectAnswers = 0
        appLaunchCount = 0
        lastLaunchDate = 0
    }
}