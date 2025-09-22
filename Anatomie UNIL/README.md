# Anatomie UNIL - iOS App

An educational quiz application for medical students studying human anatomy at UNIL (University of Lausanne).

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

## Project Structure

```
Anatomie UNIL/
├── Anatomie UNIL/           # Main app source
│   ├── Models/              # Data models (Muscle, Quiz, Settings, etc.)
│   ├── Views/               # SwiftUI views
│   ├── ViewModels/          # MVVM view models
│   ├── Services/            # Business logic services
│   ├── Data/                # Muscle database
│   └── Resources/           # Assets, localizations
├── Anatomie UNILTests/      # Unit tests
├── Anatomie UNILUITests/    # UI tests
└── Claude.md                # Development guide
```

## Features

### Quiz Categories
- **Membre supérieur** - Upper limb anatomy
- **Membre inférieur** - Lower limb anatomy
- **Tronc** - Trunk anatomy
- **Tout** - All categories combined

### Question Types
- Origins of muscles
- Insertions/terminations
- Innervation (nerve supply)
- Vascularization (blood supply)

### Quiz Features
- Configurable question count (1-50+)
- Multiple choice format
- Immediate feedback
- Progress tracking
- Grade calculation (1-6 scale)
- Question review functionality

## Development

See [Claude.md](./Claude.md) for detailed development guidelines, architecture overview, and common tasks.

## Database

The app contains 200+ muscles with complete anatomical information. The database is currently embedded in the app for offline functionality.

## Localization

The app supports French language for medical terminology, as it's designed for UNIL medical students.

## Contributing

When adding new muscles or modifying existing data:
1. Ensure medical accuracy
2. Follow existing data structure
3. Test all quiz categories
4. Verify grade calculations

## License

[Add appropriate license information]