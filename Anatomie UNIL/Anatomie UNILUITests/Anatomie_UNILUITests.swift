//
//  Anatomie_UNILUITests.swift
//  Anatomie UNILUITests
//
//  Created by Sven Borden on 22.09.2025.
//

import XCTest

final class Anatomie_UNILUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    @MainActor
    func testMainMenuAppears() throws {
        // Test that main menu elements are visible
        XCTAssertTrue(app.staticTexts["Anatomie UNIL"].exists)
        XCTAssertTrue(app.staticTexts["Quiz d'anatomie musculaire"].exists)

        // Test category buttons exist
        XCTAssertTrue(app.buttons["Membre supérieur"].exists)
        XCTAssertTrue(app.buttons["Membre inférieur"].exists)
        XCTAssertTrue(app.buttons["Tronc"].exists)
        XCTAssertTrue(app.buttons["Tout"].exists)

        // Test bottom navigation buttons
        XCTAssertTrue(app.buttons["Historique"].exists)
        XCTAssertTrue(app.buttons["Réglages"].exists)
    }

    @MainActor
    func testNavigationToQuizConfiguration() throws {
        // Tap on "Membre supérieur" category
        app.buttons["Membre supérieur"].tap()

        // Verify we're in the configuration screen
        XCTAssertTrue(app.navigationBars["Configuration"].exists)
        XCTAssertTrue(app.staticTexts["Membre supérieur"].exists)

        // Test that quiz configuration elements exist
        XCTAssertTrue(app.staticTexts["Nombre de questions"].exists)
        XCTAssertTrue(app.staticTexts["Types de questions"].exists)
        XCTAssertTrue(app.switches["Origine"].exists)
        XCTAssertTrue(app.switches["Terminaison"].exists)
        XCTAssertTrue(app.switches["Innervation"].exists)
        XCTAssertTrue(app.switches["Vascularisation"].exists)

        // Test start button exists
        XCTAssertTrue(app.buttons["Commencer"].exists)
    }

    @MainActor
    func testSettingsNavigation() throws {
        // Tap settings button
        app.buttons["Réglages"].tap()

        // Verify settings screen appears
        XCTAssertTrue(app.navigationBars["Réglages"].exists)
        XCTAssertTrue(app.staticTexts["Questions par défaut"].exists)
        XCTAssertTrue(app.staticTexts["Types de questions par défaut"].exists)
        XCTAssertTrue(app.staticTexts["Interface"].exists)

        // Test settings toggles exist
        XCTAssertTrue(app.switches["Origine"].exists)
        XCTAssertTrue(app.switches["Terminaison"].exists)
        XCTAssertTrue(app.switches["Afficher les résultats immédiatement"].exists)
        XCTAssertTrue(app.switches["Retour haptique"].exists)

        // Close settings
        app.buttons["Fermer"].tap()

        // Verify we're back to main menu
        XCTAssertTrue(app.staticTexts["Anatomie UNIL"].exists)
    }

    @MainActor
    func testHistoryNavigation() throws {
        // Tap history button
        app.buttons["Historique"].tap()

        // Verify history screen appears
        XCTAssertTrue(app.navigationBars["Historique"].exists)

        // Should show empty state initially
        XCTAssertTrue(app.staticTexts["Aucun historique"].exists)

        // Close history
        app.buttons["Fermer"].tap()

        // Verify we're back to main menu
        XCTAssertTrue(app.staticTexts["Anatomie UNIL"].exists)
    }

    @MainActor
    func testQuizFlow() throws {
        // Navigate to quiz configuration
        app.buttons["Membre supérieur"].tap()

        // Wait for configuration screen
        XCTAssertTrue(app.navigationBars["Configuration"].waitForExistence(timeout: 2))

        // Start quiz
        app.buttons["Commencer"].tap()

        // Wait for quiz to load
        let progressView = app.progressIndicators.firstMatch
        XCTAssertTrue(progressView.waitForExistence(timeout: 5))

        // Check if question appears
        let questionText = app.staticTexts.containing(NSPredicate(format: "label CONTAINS 'Quelle est'")).firstMatch
        XCTAssertTrue(questionText.waitForExistence(timeout: 3))

        // Look for answer buttons (should have 4 options)
        let answerButtons = app.buttons.allElementsBoundByIndex.filter { element in
            // Filter buttons that are likely answer options (not navigation buttons)
            return !["Quitter", "Valider", "Fermer"].contains(element.label)
        }

        if answerButtons.count >= 4 {
            // Select first answer
            answerButtons[0].tap()

            // Validate button should appear
            let validateButton = app.buttons["Valider"]
            XCTAssertTrue(validateButton.waitForExistence(timeout: 2))

            // Tap validate to proceed
            validateButton.tap()
        }

        // Test exit functionality
        app.buttons["Quitter"].tap()

        // Confirm exit in alert
        if app.alerts.firstMatch.exists {
            app.alerts.buttons["Quitter"].tap()
        }

        // Should return to main menu
        XCTAssertTrue(app.staticTexts["Anatomie UNIL"].waitForExistence(timeout: 3))
    }

    @MainActor
    func testQuestionCountSlider() throws {
        // Navigate to settings
        app.buttons["Réglages"].tap()

        // Find the slider for question count
        let slider = app.sliders.firstMatch
        XCTAssertTrue(slider.exists)

        // Test slider interaction (drag to different positions)
        let sliderStart = slider.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0.5))
        let sliderEnd = slider.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))

        sliderStart.press(forDuration: 0.1, thenDragTo: sliderEnd)

        // Close settings
        app.buttons["Fermer"].tap()
    }

    @MainActor
    func testLaunchPerformance() throws {
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
