# Lib Folder Structure

This document outlines the organized and scalable folder structure for the Itya food delivery app.

## 📁 Folder Structure

```
lib/
├── core/                           # Core functionality shared across the app
│   ├── constants/                  # App-wide constants
│   │   └── app_constants.dart     # API URLs, timeouts, validation rules
│   ├── theme/                      # App theming
│   │   ├── app_colors.dart        # Color palette
│   │   ├── app_theme.dart         # Light/Dark themes
│   │   └── app_text_styles.dart   # Typography styles
│   ├── utils/                      # Utility functions
│   │   ├── validators.dart        # Form validation
│   │   └── extensions.dart        # Dart extensions
│   ├── errors/                     # Error handling
│   ├── network/                    # API client, interceptors
│   └── storage/                    # Local storage, preferences
│
├── features/                       # Feature-based modules
│   ├── auth/                       # Authentication feature
│   │   ├── data/
│   │   │   ├── datasources/       # API calls, local storage
│   │   │   ├── models/            # Data models (JSON serialization)
│   │   │   └── repositories/      # Repository implementations
│   │   ├── domain/
│   │   │   ├── entities/          # Business objects
│   │   │   ├── repositories/      # Repository interfaces
│   │   │   └── usecases/          # Business logic
│   │   └── presentation/
│   │       ├── pages/             # Screen widgets
│   │       ├── widgets/           # Feature-specific widgets
│   │       └── bloc/              # State management
│   │
│   ├── home/                       # Home feature
│   ├── search/                     # Search feature
│   ├── restaurant/                 # Restaurant feature
│   ├── food/                       # Food feature
│   ├── cart/                       # Shopping cart feature
│   ├── order/                      # Order management feature
│   ├── profile/                    # User profile feature
│   ├── notification/               # Notifications feature
│   └── wallet/                     # Wallet feature
│
├── shared/                         # Shared components across features
│   ├── widgets/                    # Reusable UI components
│   │   ├── custom_button.dart     # Custom button widget
│   │   ├── custom_text_field.dart # Custom text field widget
│   │   └── ...                    # Other shared widgets
│   ├── utils/                      # Shared utility functions
│   ├── constants/                  # Shared constants
│   └── theme/                      # Shared theme components
│
├── router/                         # Navigation
│   ├── app_router.dart            # Route configuration
│   └── app_router.gr.dart         # Generated routes
│
└── main.dart                       # App entry point
```

## 🏗️ Architecture Principles

### 1. **Feature-Based Organization**

- Each feature is self-contained with its own data, domain, and presentation layers
- Features can be developed independently
- Easy to add/remove features without affecting others

### 2. **Clean Architecture**

- **Data Layer**: Handles data sources (API, local storage)
- **Domain Layer**: Contains business logic and entities
- **Presentation Layer**: UI components and state management

### 3. **Separation of Concerns**

- **Core**: App-wide functionality (theme, constants, utilities)
- **Features**: Feature-specific functionality
- **Shared**: Reusable components across features

## 📋 Naming Conventions

### Files

- `snake_case.dart` for file names
- `PascalCase` for class names
- `camelCase` for variables and functions

### Folders

- `snake_case` for folder names
- Feature names should be singular (e.g., `auth`, not `auths`)

## 🔧 Usage Examples

### Adding a New Feature

1. Create feature folder: `lib/features/new_feature/`
2. Add data, domain, presentation subfolders
3. Implement the three layers
4. Add routes to `app_router.dart`

### Using Shared Components

```dart
import '../../shared/widgets/custom_button.dart';

CustomButton(
  text: 'Login',
  onPressed: () {},
  type: ButtonType.primary,
)
```

### Using Core Utilities

```dart
import '../../core/utils/validators.dart';
import '../../core/theme/app_colors.dart';

// Validation
String? emailError = Validators.email(emailController.text);

// Colors
Container(color: AppColors.primary)
```

## 🚀 Benefits

- **Scalable**: Easy to add new features
- **Maintainable**: Clear separation of concerns
- **Testable**: Each layer can be tested independently
- **Reusable**: Shared components reduce code duplication
- **Team-friendly**: Multiple developers can work on different features
- **Clean**: Follows Flutter and Dart best practices
