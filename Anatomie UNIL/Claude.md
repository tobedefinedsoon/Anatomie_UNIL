# Claude.md - Development Guide for Anatomie UNIL

## Project Overview
Anatomie UNIL is an iOS educational quiz app for medical students studying human anatomy at UNIL (University of Lausanne). The app has been migrated from Xamarin.iOS (C#) to SwiftUI.

## Architecture

### Technology Stack
- **Platform**: iOS (iPhone & iPad universal)
- **Language**: Swift
- **UI Framework**: SwiftUI
- **Architecture**: MVVM pattern
- **Data**: Local muscle database

### Key Components

#### Models (`Models/`)
- `Muscle.swift` - Core muscle data structure
- `Quiz.swift` - Quiz session management
- `Settings.swift` - User preferences
- `Statistics.swift` - Performance tracking

#### ViewModels (`ViewModels/`)
- `QuizViewModel.swift` - Main quiz logic and state management

#### Views (`Views/`)
- `ContentView.swift` - Main entry point
- `HistoryView.swift` - Quiz history and statistics
- Additional view files for different screens

#### Services (`Services/`)
- `QuizService.swift` - Quiz logic and question generation

#### Data (`Data/`)
- `MuscleDatabase.swift` - Contains 200+ muscle definitions with properties

## Quiz Categories
1. **Membre supérieur** (Upper limb) - shoulder, arm, forearm, hand muscles
2. **Membre inférieur** (Lower limb) - hip, thigh, leg, foot muscles
3. **Tronc** (Trunk) - neck, back, thorax, abdomen muscles
4. **Tout** (All) - Combined quiz from all categories

## Question Types
- **Origin** - Where the muscle originates
- **Insertion/Termination** - Where the muscle inserts
- **Innervation** - Nerve supply of the muscle
- **Vascularization** - Blood supply (arteries)

## Development Commands

### Build and Test
```bash
# Build the project
xcodebuild -project "Anatomie UNIL.xcodeproj" -scheme "Anatomie UNIL" build

# Run tests
xcodebuild -project "Anatomie UNIL.xcodeproj" -scheme "Anatomie UNIL" test
```

### Common Development Tasks

#### Adding New Muscles
1. Edit `Data/MuscleDatabase.swift`
2. Add muscle data following existing structure
3. Ensure all four properties are included (origin, insertion, innervation, vascularization)

#### Modifying Quiz Logic
- Primary logic in `Services/QuizService.swift`
- State management in `ViewModels/QuizViewModel.swift`

#### UI Changes
- SwiftUI views in `Views/` directory
- Follow existing design patterns and accessibility standards

## Code Style Guidelines
- Follow Swift naming conventions
- Use SwiftUI best practices
- Maintain MVVM separation of concerns
- Add comments for complex medical terminology
- Ensure French language support for medical terms

## Testing Strategy
- Unit tests for quiz logic
- UI tests for critical user flows
- Test all quiz categories and question types
- Verify grade calculation accuracy (1-6 scale)

## Deployment Notes
- Target iOS 14.0+
- Universal app (iPhone/iPad)
- App Store submission requires medical accuracy review
- Consider accessibility requirements for educational apps

## Known Issues/Technical Debt
- Migration from Xamarin complete
- Database could be externalized for easier updates
- Consider adding multimedia support (images, audio)
- Performance optimization for large muscle database

## Contact
- Report bugs via in-app email feature
- Development questions: Contact repository maintainer