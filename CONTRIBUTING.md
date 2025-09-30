# Contributing to Anatomie UNIL

We welcome contributions to improve the Anatomie UNIL app! This guide will help you get started.

## Getting Started

1. **Fork the repository** and clone your fork locally
2. **Set up development environment** following the [Development Guide](docs/DEVELOPMENT.md)
3. **Create a feature branch** for your changes
4. **Make your changes** following our coding standards
5. **Test thoroughly** before submitting
6. **Submit a pull request** with clear description

## Types of Contributions

### Adding New Muscles
- Edit `Data/MuscleDatabase.swift`
- Ensure all four properties are included:
  - Origin
  - Insertion
  - Innervation
  - Vascularization
- Verify medical accuracy with authoritative sources
- Test with all quiz categories

### Bug Reports
- Use GitHub Issues to report bugs
- Include steps to reproduce
- Specify iOS version and device type
- Add screenshots if applicable

### Feature Requests
- Describe the educational value
- Consider impact on existing functionality
- Provide use cases and examples
- Discuss implementation approach

## Code Standards

### Swift Style Guide
- Follow Swift naming conventions
- Use meaningful variable and function names
- Add documentation for public interfaces
- Maintain consistent indentation (4 spaces)

### Architecture Guidelines
- Maintain MVVM separation of concerns
- Keep views lightweight
- Use dependency injection where appropriate
- Follow existing patterns in the codebase

### Medical Accuracy
- Verify anatomical information with multiple sources
- Use terminology consistent with UNIL curriculum
- Ensure French language accuracy
- Cross-reference with medical textbooks

## Testing Requirements

### Unit Tests
- Write tests for new quiz logic
- Test muscle database modifications
- Verify grade calculation accuracy
- Test question generation algorithms

### Manual Testing
- Test all quiz categories
- Verify question type toggles
- Check grade calculation (1-6 scale)
- Test on both iPhone and iPad

## Pull Request Process

1. **Update documentation** if needed
2. **Add or update tests** for new functionality
3. **Ensure all tests pass**
4. **Follow commit message conventions**
5. **Request review** from maintainers

### Commit Message Format
```
type(scope): brief description

Longer description if needed

- Bullet points for details
- Reference issues: #123
```

Types: `feat`, `fix`, `docs`, `test`, `refactor`

## Development Setup

See the [Development Guide](docs/DEVELOPMENT.md) for detailed setup instructions including:
- Xcode configuration
- Building and running
- Common development tasks
- Debugging tips

## Questions?

- Check [Troubleshooting Guide](docs/TROUBLESHOOTING.md)
- Review existing [Issues](https://github.com/[username]/Anatomie_UNIL/issues)
- Contact maintainers through GitHub

## Code of Conduct

- Be respectful and constructive
- Focus on educational value
- Maintain medical accuracy
- Help others learn and improve