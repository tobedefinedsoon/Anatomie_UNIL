//
//  Settings.swift
//  Anatomie UNIL
//
//  Created by Assistant on 22.09.2025.
//

import Foundation
import SwiftUI

class Settings: ObservableObject {
    @AppStorage("questionCount") var questionCount: Int = 20
    @AppStorage("enableOrigin") var enableOrigin: Bool = true
    @AppStorage("enableInsertion") var enableInsertion: Bool = true
    @AppStorage("enableInnervation") var enableInnervation: Bool = true
    @AppStorage("enableVascularization") var enableVascularization: Bool = false
    @AppStorage("showResultsImmediately") var showResultsImmediately: Bool = true
    @AppStorage("hapticFeedback") var hapticFeedback: Bool = true

    var enabledQuestionTypes: [QuestionType] {
        var types: [QuestionType] = []
        if enableOrigin { types.append(.origin) }
        if enableInsertion { types.append(.insertion) }
        if enableInnervation { types.append(.innervation) }
        if enableVascularization { types.append(.vascularization) }
        return types.isEmpty ? [.origin] : types // At least one type must be enabled
    }

    func reset() {
        questionCount = 20
        enableOrigin = true
        enableInsertion = true
        enableInnervation = true
        enableVascularization = false
        showResultsImmediately = true
        hapticFeedback = true
    }
}