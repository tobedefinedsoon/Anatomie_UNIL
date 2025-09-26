//
//  QuizView.swift
//  Anatomie UNIL
//
//  Created by Assistant on 22.09.2025.
//

import SwiftUI
import SwiftData

struct QuizView: View {
    let category: MuscleCategory?

    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject private var settings: Settings
    @Environment(\.dismiss) private var dismiss

    @State private var viewModel: QuizViewModel

    init(category: MuscleCategory?) {
        self.category = category
        // Initialize with dummy values - will be properly set in onAppear with actual context
        self._viewModel = State(initialValue: QuizViewModel(
            quizService: QuizService(
                modelContext: try! ModelContext(ModelContainer(for: Muscle.self, Quiz.self, QuizQuestion.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))),
                settings: Settings()
            ),
            settings: Settings()
        ))
    }

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

                if viewModel.isQuizCompleted {
                    QuizResultsView(quiz: viewModel.currentQuiz!)
                } else {
                    VStack(spacing: 0) {
                        // Question content
                        if let question = viewModel.currentQuestion {
                            QuizQuestionView(
                                question: question,
                                selectedAnswer: viewModel.selectedAnswer,
                                onAnswerSelected: { answer in
                                    viewModel.selectAnswer(answer)
                                },
                                onSubmit: {
                                    viewModel.submitAnswer()
                                },
                                onNext: {
                                    viewModel.moveToNextQuestion()
                                },
                                showingResult: viewModel.showingResults,
                                isCorrect: viewModel.isAnswerCorrect,
                                autoAdvanceCountdown: viewModel.autoAdvanceCountdown,
                                showNextButton: viewModel.showNextButton,
                                showResultsImmediately: settings.showResultsImmediately,
                                questionTimeRemaining: viewModel.questionTimeRemaining,
                                questionProgress: viewModel.questionProgress,
                                totalTime: settings.timePerQuestion
                            )
                        }

                        // Progress footer
                        QuizProgressHeader(
                            progress: viewModel.progress,
                            progressText: viewModel.progressText
                        )
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .onAppear {
            // Properly initialize viewModel with the actual context and settings
            let quizService = QuizService(modelContext: modelContext, settings: settings)
            viewModel = QuizViewModel(quizService: quizService, settings: settings)
            viewModel.startQuiz(category: category)
        }
    }
}

struct QuizProgressHeader: View {
    let progress: Double
    let progressText: String

    var body: some View {
        VStack(spacing: 12) {
            ProgressView(value: progress)
                .tint(.white.opacity(0.8))
                .scaleEffect(y: 2)

            Text(progressText)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.white.opacity(0.9))
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(Color.white.opacity(0.15))
        .cornerRadius(12)
    }
}

struct QuizQuestionView: View {
    let question: QuizQuestion
    let selectedAnswer: String?
    let onAnswerSelected: (String) -> Void
    let onSubmit: () -> Void
    let onNext: () -> Void
    let showingResult: Bool
    let isCorrect: Bool?
    let autoAdvanceCountdown: Int
    let showNextButton: Bool
    let showResultsImmediately: Bool
    let questionTimeRemaining: Int
    let questionProgress: Double
    let totalTime: Int

    var body: some View {
        VStack(spacing: 24) {
            // Question with animated border
            VStack(spacing: 16) {
                Text(question.question)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(12)
                    .overlay(
                        // Animated border that fills as time progresses
                        RoundedRectangle(cornerRadius: 12)
                            .strokeBorder(
                                AngularGradient(
                                    gradient: Gradient(colors: [
                                        questionTimeRemaining <= 5 ? .purple : .blue,
                                        .clear
                                    ]),
                                    center: .center,
                                    startAngle: .degrees(-90),
                                    endAngle: .degrees(-90 + (360 * questionProgress))
                                ),
                                lineWidth: showingResult ? 0 : 4
                            )
                            .animation(.linear(duration: 1), value: questionProgress)
                    )
                    .overlay(
                        // Timer digit in bottom right corner
                        Group {
                            if questionTimeRemaining > 0 && !showingResult {
                                VStack {
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        Text("\(questionTimeRemaining)")
                                            .font(.caption)
                                            .fontWeight(.medium)
                                            .foregroundColor(.gray.opacity(0.7))
                                            .padding(.trailing, 8)
                                            .padding(.bottom, 8)
                                    }
                                }
                            }
                        }
                    )
            }
            .padding(.top, 40)

            // Answer options
            Group {
                if UIDevice.current.userInterfaceIdiom == .pad || UIDevice.current.orientation.isLandscape {
                    // Grid layout for iPad or landscape orientation
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(question.options, id: \.self) { option in
                            AnswerButton(
                                text: option,
                                isSelected: selectedAnswer == option,
                                isCorrect: showingResult ? option == question.correctAnswer : nil,
                                isUserAnswer: showingResult && selectedAnswer == option
                            ) {
                                if !showingResult || !showResultsImmediately {
                                    onAnswerSelected(option)
                                }
                            }
                        }
                    }
                } else {
                    // Vertical stack for portrait iPhone
                    VStack(spacing: 16) {
                        ForEach(question.options, id: \.self) { option in
                            AnswerButton(
                                text: option,
                                isSelected: selectedAnswer == option,
                                isCorrect: showingResult ? option == question.correctAnswer : nil,
                                isUserAnswer: showingResult && selectedAnswer == option
                            ) {
                                if !showingResult || !showResultsImmediately {
                                    onAnswerSelected(option)
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 20)

            // Feedback section
            if showingResult, let isCorrect = isCorrect {
                VStack(spacing: 8) {
                    Label(
                        isCorrect ? "Correct !" : "Incorrect",
                        systemImage: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill"
                    )
                    .font(.headline)
                    .foregroundColor(isCorrect ? .green : .red)

                    if isCorrect && autoAdvanceCountdown >= 0 {
                        VStack(spacing: 4) {
                            Text("Question suivante dans")
                                .font(.caption)
                                .foregroundColor(.secondary)

                            ZStack {
                                Circle()
                                    .stroke(.gray.opacity(0.3), lineWidth: 4)
                                    .frame(width: 40, height: 40)

                                Circle()
                                    .trim(from: 0, to: CGFloat(max(0, autoAdvanceCountdown)) / 3.0)
                                    .stroke(.blue, lineWidth: 4)
                                    .frame(width: 40, height: 40)
                                    .rotationEffect(.degrees(-90))
                                    .animation(.linear(duration: 1), value: autoAdvanceCountdown)

                                Text("\(autoAdvanceCountdown)")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
                .padding(.top, 20)
            }

            Spacer()

            // Submit/Next button
            if selectedAnswer != nil {
                if !showingResult {
                    Button(action: onSubmit) {
                        Text("Valider")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(
                                    colors: [Color.blue, Color.purple.opacity(0.8)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(12)
                            .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                } else if showNextButton {
                    Button(action: onNext) {
                        Text("Suivant")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(12)
                            .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                }
            }
        }
    }
}

struct AnswerButton: View {
    let text: String
    let isSelected: Bool
    let isCorrect: Bool?
    let isUserAnswer: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(foregroundColor)
                .padding()
                .frame(maxWidth: .infinity)
                .frame(minHeight: 60)
                .background(backgroundColor)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(borderColor, lineWidth: borderWidth)
                )
                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
        }
        .disabled(isCorrect != nil) // Disable when showing results
    }

    private var backgroundColor: Color {
        if let isCorrect = isCorrect {
            if text == selectedAnswer {
                return isCorrect ? .green.opacity(0.9) : .red.opacity(0.9)
            } else if isCorrect && !isUserAnswer {
                return .green.opacity(0.9)
            }
        }

        return isSelected ? .blue.opacity(0.3) : Color.white.opacity(0.9)
    }

    private var foregroundColor: Color {
        if let isCorrect = isCorrect {
            if text == selectedAnswer {
                return isCorrect ? .white : .white
            } else if isCorrect && !isUserAnswer {
                return .white
            }
        }

        return isSelected ? .blue : .primary
    }

    private var borderColor: Color {
        if let isCorrect = isCorrect {
            if text == selectedAnswer {
                return isCorrect ? .green : .red
            } else if isCorrect && !isUserAnswer {
                return .green
            }
        }

        return isSelected ? .blue : .gray.opacity(0.3)
    }

    private var borderWidth: CGFloat {
        isSelected || isCorrect != nil ? 2 : 1
    }

    private var selectedAnswer: String? {
        isUserAnswer ? text : nil
    }
}

#Preview {
    QuizView(category: .upperLimb)
        .environmentObject(Settings())
        .modelContainer(for: [Muscle.self, Quiz.self, QuizQuestion.self])
}