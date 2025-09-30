# Troubleshooting Guide

Common issues and solutions for developing and using Anatomie UNIL.

## Build Issues

### Xcode Build Failures

**Problem**: Project won't build in Xcode
```
Build failed with errors
```

**Solutions**:
1. Clean build folder: `Product → Clean Build Folder` (⌘+Shift+K)
2. Delete derived data: `~/Library/Developer/Xcode/DerivedData`
3. Restart Xcode
4. Check iOS deployment target (minimum 14.0)

**Problem**: Swift compiler errors after updates
```
Use of undeclared type 'SomeType'
```

**Solutions**:
1. Check import statements
2. Verify target membership of new files
3. Rebuild project dependencies

### Simulator Issues

**Problem**: App crashes on launch in simulator
```
Thread 1: signal SIGABRT
```

**Solutions**:
1. Reset simulator: `Device → Erase All Content and Settings`
2. Try different simulator versions
3. Check console logs for specific error messages
4. Verify app bundle is properly signed

**Problem**: Simulator not showing or responsive
```
Simulator not responding
```

**Solutions**:
1. Quit and restart Simulator app
2. Reset simulator content
3. Restart development machine if persistent

## Runtime Issues

### Quiz Functionality

**Problem**: Questions not generating properly
```
Empty question set or duplicates appearing
```

**Solutions**:
1. Check muscle database integrity in `Data/MuscleDatabase.swift`
2. Verify question type selections
3. Ensure category has sufficient muscles
4. Check random generation logic

**Problem**: Incorrect grade calculations
```
Grade doesn't match expected percentage
```

**Solutions**:
1. Verify grade scale mapping (1-6 scale)
2. Check percentage calculation logic
3. Test with known answer sets
4. Review `QuizService.swift` grade methods

### Data Issues

**Problem**: Missing muscle information
```
Muscle data incomplete or nil values
```

**Solutions**:
1. Check `MuscleDatabase.swift` structure
2. Verify all required properties (origin, insertion, innervation, vascularization)
3. Validate data format consistency
4. Check for encoding issues with French characters

## Development Environment

### Xcode Setup

**Problem**: Xcode version compatibility
```
Project requires newer Xcode version
```

**Solutions**:
1. Update to Xcode 14.0 or later
2. Check macOS compatibility
3. Update iOS deployment target if needed

**Problem**: Device provisioning issues
```
Code signing error
```

**Solutions**:
1. Check Apple Developer account status
2. Refresh provisioning profiles
3. Verify bundle identifier
4. Check device registration

### Performance Issues

**Problem**: Slow quiz loading
```
App hangs during question generation
```

**Solutions**:
1. Profile in Instruments for bottlenecks
2. Check muscle database size and queries
3. Optimize random selection algorithms
4. Consider pagination for large datasets

**Problem**: Memory warnings
```
Received memory warning
```

**Solutions**:
1. Profile memory usage in Instruments
2. Check for retain cycles in ViewModels
3. Optimize image and asset loading
4. Review data caching strategies

## Testing Issues

### Unit Tests

**Problem**: Tests failing after changes
```
XCTAssertEqual failed
```

**Solutions**:
1. Update test expectations after code changes
2. Check test data consistency
3. Verify mock objects and dependencies
4. Run tests individually to isolate issues

**Problem**: UI tests timing out
```
UI test failed to find element
```

**Solutions**:
1. Add explicit waits for UI elements
2. Check accessibility identifiers
3. Verify UI hierarchy changes
4. Test on slower simulators

## Medical Content Issues

### Accuracy Concerns

**Problem**: Reported medical inaccuracies
```
User reports incorrect anatomical information
```

**Solutions**:
1. Cross-reference with authoritative medical sources
2. Verify against UNIL curriculum
3. Check multiple medical textbooks
4. Consult with medical faculty if needed

**Problem**: French language issues
```
Incorrect medical terminology
```

**Solutions**:
1. Verify with French medical dictionaries
2. Check UNIL standard terminology
3. Ensure proper character encoding
4. Test with French language settings

## Getting Help

### When to Seek Help

1. **Build issues persist** after trying above solutions
2. **Medical accuracy questions** require expert consultation
3. **Performance problems** need profiling expertise
4. **Architecture decisions** impact multiple components

### How to Report Issues

1. **Search existing issues** in GitHub repository
2. **Provide detailed description** including:
   - Steps to reproduce
   - Expected vs actual behavior
   - Environment details (Xcode version, iOS version, device)
   - Error messages and logs
3. **Include relevant code snippets** or screenshots
4. **Tag appropriately** (bug, enhancement, question)

### Additional Resources

- [Apple Developer Documentation](https://developer.apple.com/documentation/)
- [SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui)
- [Xcode User Guide](https://help.apple.com/xcode/)
- [iOS Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/ios/)