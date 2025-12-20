# Workouch

**AI-Powered Fitness App** - A Flutter application that helps users create, manage, and execute personalized workouts with AI assistance.

## 📱 Overview

Workouch is a comprehensive fitness application that combines AI-powered workout generation with manual workout management. The app offers two distinct modes: **"The Shuffle"** (AI-powered quick workouts) and **"The Neat"** (manual workout builder), providing flexibility for users of all fitness levels.

## ✨ Key Features

### 🤖 AI-Powered Workout Generation
- **"The Shuffle" Mode**: Generate workouts from natural language preferences
  - Users describe their workout needs (e.g., "I have 30 minutes and a pair of dumbbells")
  - AI analyzes preferences and generates personalized workouts
  - Animated dialog shows AI thinking process with dynamic messages
  
- **"The Neat" Mode**: Structured workout generation with detailed specifications
  - Specify workout name, duration, intensity, goals, body parts, equipment, location
  - Account for injuries/limitations
  - AI generates workouts based on structured parameters

### 💪 Workout Management
- **Create & Edit Workouts**: Build custom workouts with exercises, sets, and rest times
- **Exercise Library**: Browse and filter exercises by muscle groups, equipment, and body parts
- **Multiple Set Types**: Support for weight-based, time-based, distance-based, and reps-only sets
- **Workout Persistence**: Save workouts to cloud (Supabase) with automatic sync

### 🏋️ Workout Execution
- **Interactive Workout Sessions**: Step-by-step workout execution with timers
- **Rest Timers**: Automatic rest timers between sets and exercises
- **Exercise Details**: View GIFs, instructions, and muscle targets during workouts
- **Progress Tracking**: Track workout completion and duration

### 👤 User Profile
- **Health Metrics**: Track weight, height, BMI, activity level
- **Social Authentication**: Sign in with Google, Apple, or Email
- **Profile Management**: Update user information and preferences

### 🎨 User Experience
- **Modern UI**: Clean, intuitive interface with smooth animations
- **Responsive Design**: Adaptive layouts using Flutter ScreenUtil
- **Lottie Animations**: Engaging loading animations and visual feedback
- **Error Handling**: Comprehensive error handling with user-friendly messages

## 🏗️ Architecture

The app follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── core/                    # Core functionality
│   ├── constants/           # App constants and configuration
│   ├── di/                  # Dependency injection (GetIt + Injectable)
│   ├── router/              # Navigation (GoRouter)
│   ├── services/            # Core services (Firebase, etc.)
│   ├── theme/               # App theming and styling
│   ├── utils/               # Utilities (error handling, logging)
│   └── widgets/             # Reusable UI components
│
└── features/                # Feature modules
    ├── auth/                # Authentication
    │   ├── data/            # Data layer (DTOs, services)
    │   ├── domain/          # Domain layer (entities, repositories)
    │   └── presentation/    # Presentation layer (UI, Cubits)
    ├── workout/             # Workout management
    ├── workout_session/     # Workout execution
    ├── home/                # Home screen
    └── profile/             # User profile
```

### Data Flow
```
UI (Cubit/State)
  ↓
Repository Interface (Domain)
  ↓
Repository Implementation (Data)
  ↓
Data Source (Supabase/API)
  ↓
Database/External API
```

## 🛠️ Tech Stack

### Core Framework
- **Flutter** 3.8.1+ - Cross-platform UI framework
- **Dart** - Programming language

### State Management
- **flutter_bloc** ^9.1.1 - BLoC pattern for state management
- **Cubit** - Lightweight state management

### Backend & Database
- **Supabase** - Backend-as-a-Service (PostgreSQL, Auth, Storage)
- **Row Level Security (RLS)** - Data isolation and security

### API Integration
- **Dio** ^5.9.0 - HTTP client
- **Retrofit** ^4.9.0 - Type-safe REST client
- **OpenAI API** - AI workout generation (via Exercise DB API)

### Dependency Injection
- **get_it** ^8.0.3 - Service locator
- **injectable** ^2.5.0 - Code generation for DI

### Data Modeling
- **freezed** ^2.5.8 - Immutable data classes
- **json_serializable** ^6.9.5 - JSON serialization

### Authentication
- **supabase_flutter** ^2.9.1 - Supabase authentication
- **google_sign_in** ^6.3.0 - Google Sign-In
- **sign_in_with_apple** ^7.0.1 - Apple Sign-In

### UI & Design
- **flutter_screenutil** ^5.9.3 - Responsive design
- **flutter_svg** ^2.2.0 - SVG support
- **google_fonts** ^6.2.1 - Custom fonts
- **lottie** ^3.3.2 - Lottie animations
- **cached_network_image** ^3.4.1 - Image caching

### Utilities
- **flutter_dotenv** ^5.2.1 - Environment variables
- **shared_preferences** ^2.5.3 - Local storage
- **go_router** ^16.3.0 - Declarative routing
- **oktoast** ^3.4.0 - Toast notifications
- **logger** ^2.6.0 - Logging
- **intl** ^0.20.2 - Internationalization

### Firebase Services
- **firebase_core** ^3.15.1 - Firebase initialization
- **firebase_crashlytics** ^4.3.9 - Crash reporting
- **firebase_analytics** ^11.5.2 - Analytics
- **firebase_remote_config** ^5.4.7 - Remote configuration

### Monetization
- **purchases_flutter** ^8.10.6 - RevenueCat for in-app purchases
- **in_app_review** ^2.0.10 - In-app review prompts

## 📊 Database Schema

The app uses **Supabase (PostgreSQL)** with the following schema:

### Tables

#### `workouts`
- `id` (UUID, Primary Key)
- `user_id` (UUID, Foreign Key → auth.users)
- `name` (TEXT)
- `rest_time_between_exercises` (INTEGER, seconds)
- `created_at` (TIMESTAMPTZ)
- `updated_at` (TIMESTAMPTZ)

#### `workout_exercises`
- `id` (UUID, Primary Key)
- `workout_id` (UUID, Foreign Key → workouts)
- `exercise_order` (INTEGER)
- `exercise_id` (TEXT) - Reference to external exercise API
- Exercise snapshot fields: `name`, `gif_url`, `description`, `target_muscles`, `body_parts`, `equipments`, `secondary_muscles`, `instructions`
- `rest_time_between_sets` (INTEGER, seconds)
- `set_type` (TEXT) - 'weightBased', 'timeBased', 'distanceBased', 'repsOnly'
- `sets` (JSONB) - Array of set objects
- `created_at` (TIMESTAMPTZ)
- `updated_at` (TIMESTAMPTZ)

### Security
- **Row Level Security (RLS)** enabled on all tables
- Users can only access their own workouts
- Policies use `auth.uid() = user_id` for data isolation

### Features
- **Automatic timestamps**: Triggers update `updated_at` on changes
- **Cascading deletes**: Deleting a workout deletes associated exercises
- **Indexes**: Optimized queries on `user_id` and `exercise_order`
- **JSONB sets**: Flexible set storage with type-specific fields

See [`docs/workout_database_schema.md`](docs/workout_database_schema.md) for detailed schema documentation.

## 🔌 API Integrations

### Exercise DB API
- **Base URL**: `https://api.vigorworkouch.com/api/v1`
- **Authentication**: API key via `x-api-key` header
- **Endpoints**:
  - `GET /exercises/filter` - Filter and search exercises
  - `GET /bodyparts` - Get available body parts
  - `GET /equipments` - Get available equipment types
  - `POST /workouts/generate` - Generate AI workouts

### OpenAI Integration
- AI workout generation is handled through the Exercise DB API
- Uses OpenAI's Chat Completions API with vector store for exercise selection
- Two generation modes:
  - **Shuffle Mode**: Natural language preferences → structured workout
  - **Neat Mode**: Structured parameters → personalized workout

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.8.1 or higher
- Dart SDK
- Android Studio / Xcode (for mobile development)
- Supabase account
- Exercise DB API access

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd workouch
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up environment variables**
   - Create a `.env` file in the root directory
   - Add the following variables:
     ```
     EXERCISE_DB_API_KEY=your_api_key_here
     SUPABASE_URL=your_supabase_url
     SUPABASE_ANON_KEY=your_supabase_anon_key
     ```

4. **Configure Firebase**
   - Add `google-services.json` (Android) to `android/app/`
   - Add `GoogleService-Info.plist` (iOS) to `ios/Runner/`
   - Configure Firebase project settings

5. **Set up Supabase**
   - Create a Supabase project
   - Run the SQL scripts in `docs/workout_database_schema.sql`
   - Configure authentication providers (Google, Apple)

6. **Generate code**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

7. **Run the app**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
lib/
├── core/
│   ├── constants/          # App-wide constants
│   ├── di/                  # Dependency injection setup
│   ├── router/              # Navigation configuration
│   ├── services/            # Core services (Firebase)
│   ├── theme/               # Colors, text styles, themes
│   ├── utils/               # Utilities (errors, logging, extensions)
│   └── widgets/             # Reusable UI components
│
└── features/
    ├── auth/                # Authentication feature
    │   ├── data/
    │   │   ├── models/dtos/ # Data Transfer Objects
    │   │   └── services/     # Auth services (Supabase)
    │   ├── domain/
    │   │   ├── entities/     # Domain entities
    │   │   └── repositories/ # Repository interfaces
    │   └── presentation/
    │       ├── cubit/        # State management
    │       └── pages/        # UI pages
    │
    ├── workout/             # Workout management feature
    │   ├── data/
    │   │   ├── models/
    │   │   │   ├── dtos/     # DTOs for API responses
    │   │   │   └── requests/ # Request models
    │   │   ├── repositories/ # Repository implementations
    │   │   └── services/     # API services (Retrofit)
    │   ├── domain/
    │   │   ├── entities/     # Domain entities
    │   │   ├── enums/         # Domain enums
    │   │   └── repositories/ # Repository interfaces
    │   └── presentation/
    │       ├── cubit/        # State management
    │       ├── dialogs/      # Feature-specific dialogs
    │       ├── pages/         # UI pages
    │       └── widgets/       # Feature-specific widgets
    │
    ├── workout_session/     # Workout execution feature
    ├── home/                 # Home screen feature
    └── profile/             # User profile feature
```

## 🔑 Key Implementation Details

### AI Workout Generation
- Uses OpenAI API via Exercise DB backend
- Prompts are engineered to select exercises from a vector store
- Response format matches domain entities (camelCase JSON)
- Dynamic message updates during generation (every 5 seconds)
- Validates generated workouts have exercises before returning

### State Management
- **BLoC/Cubit pattern** for predictable state management
- Separate Cubits for each feature (AuthCubit, WorkoutCubit, WorkoutSessionCubit)
- Immutable states using `freezed`
- Error handling via `Either<Error, T>` pattern

### Error Handling
- Centralized error handling in `core/utils/error.dart`
- Categorizes errors: network, server, validation, other
- User-friendly error messages
- Comprehensive exception handling with `handleException` utility

### Dependency Injection
- Uses `get_it` with `injectable` for code generation
- Lazy singletons for services and repositories
- Named dependencies for multiple Dio instances
- Auto-generated `injection.config.dart`

### Data Flow
1. **UI** triggers action via Cubit
2. **Cubit** calls Repository interface
3. **Repository** implementation calls Data Source
4. **Data Source** interacts with Supabase/API
5. **Response** converted to DTO → Entity
6. **Entity** returned via `Either<Error, T>`
7. **Cubit** updates state
8. **UI** rebuilds with new state

### Set Types
The app supports four set types:
- **Weight-Based**: Sets × Reps × Weight (kg)
- **Time-Based**: Duration (seconds)
- **Distance-Based**: Distance (meters)
- **Reps-Only**: Sets × Reps (no weight)

Sets are stored as JSONB in PostgreSQL and converted to union types using `freezed`.

## 🧪 Development

### Code Generation
Run code generation after making changes to:
- `freezed` classes
- `json_serializable` classes
- `injectable` dependencies
- `retrofit` services

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Linting
The project uses `flutter_lints` for code quality:
```bash
flutter analyze
```

### Building

**Android:**
```bash
flutter build apk --release
# or
flutter build appbundle --release
```

**iOS:**
```bash
flutter build ios --release
```

## 📝 Environment Variables

Required environment variables (`.env` file):
- `EXERCISE_DB_API_KEY` - API key for Exercise DB
- `SUPABASE_URL` - Supabase project URL
- `SUPABASE_ANON_KEY` - Supabase anonymous key

Optional (for Firebase):
- Firebase configuration files are required for crashlytics and analytics

## 🔒 Security

- **Row Level Security (RLS)** on all database tables
- API keys stored in environment variables (not committed)
- Secure authentication via Supabase Auth
- OAuth providers (Google, Apple) configured securely
- Input validation on all user inputs

## 📄 License

[Add your license here]

## 🤝 Contributing

[Add contribution guidelines here]

## 📞 Support

[Add support information here]

---

**Built with ❤️ using Flutter**
