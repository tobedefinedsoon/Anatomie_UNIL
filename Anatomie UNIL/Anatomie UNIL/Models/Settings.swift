//
//  Settings.swift
//  Anatomie UNIL
//
//  Created by Assistant on 22.09.2025.
//

import Foundation
import SwiftUI
import Combine

class Settings: ObservableObject {
    @AppStorage("questionCount") var questionCount: Int = 20 {
        didSet { objectWillChange.send() }
    }
    @AppStorage("enableOrigin") var enableOrigin: Bool = true {
        didSet { objectWillChange.send() }
    }
    @AppStorage("enableInsertion") var enableInsertion: Bool = true {
        didSet { objectWillChange.send() }
    }
    @AppStorage("enableInnervation") var enableInnervation: Bool = true {
        didSet { objectWillChange.send() }
    }
    @AppStorage("enableVascularization") var enableVascularization: Bool = false {
        didSet { objectWillChange.send() }
    }
    @AppStorage("showResultsImmediately") var showResultsImmediately: Bool = true {
        didSet { objectWillChange.send() }
    }
    @AppStorage("hapticFeedback") var hapticFeedback: Bool = true {
        didSet { objectWillChange.send() }
    }
    @AppStorage("timePerQuestion") var timePerQuestion: Int = 30 {
        didSet { objectWillChange.send() }
    }

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
        timePerQuestion = 30
    }
}