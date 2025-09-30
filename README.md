# Anatomie UNIL

An educational iOS quiz application for medical students studying human anatomy at UNIL (University of Lausanne).

## Quick Start

### Prerequisites
- Xcode 14.0 or later
- iOS 14.0+ deployment target
- macOS for development

### Running the App
1. Open `Anatomie UNIL.xcodeproj` in Xcode
2. Select your target device/simulator
3. Press ⌘+R to build and run

### Testing
```bash
# Run unit tests
xcodebuild -project "Anatomie UNIL.xcodeproj" -scheme "Anatomie UNIL" test

# Or use Xcode: ⌘+U
```

## Features

The app tests knowledge of muscle anatomy across four categories:
- **Membre supérieur** - Upper limb anatomy
- **Membre inférieur** - Lower limb anatomy
- **Tronc** - Trunk anatomy
- **Tout** - All categories combined

Quiz features include configurable question count, multiple choice format, immediate feedback, and detailed review functionality with grade calculation (1-6 scale).

## Project Structure

```
Anatomie UNIL/
├── Anatomie UNIL/           # Main app source
│   ├── Models/              # Data models
│   ├── Views/               # SwiftUI views
│   ├── ViewModels/          # MVVM view models
│   ├── Services/            # Business logic
│   ├── Data/                # Muscle database (200+ muscles)
│   └── Assets.xcassets/     # App resources
├── Anatomie UNILTests/      # Unit tests
└── Anatomie UNILUITests/    # UI tests
```

## Documentation

- [Development Guide](docs/DEVELOPMENT.md) - Setup, architecture, and coding guidelines
- [Features](docs/FEATURES.md) - Detailed feature documentation
- [Contributing](CONTRIBUTING.md) - How to contribute to the project
- [Troubleshooting](docs/TROUBLESHOOTING.md) - Common issues and solutions

## Technology Stack

- **Platform**: iOS (iPhone & iPad universal)
- **Language**: Swift
- **UI Framework**: SwiftUI
- **Architecture**: MVVM pattern
- **Data**: Local muscle database

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on:
- Adding new muscles to the database
- Reporting bugs
- Submitting feature requests
- Code style and testing requirements

## License

[License information to be added]
