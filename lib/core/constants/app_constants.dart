import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  AppConstants._();

  // Class constants
  static final timeConst = _Time();
  static final supabase = _Supabase();

  // Exercise DB
  static const exerciseDb = 'exercise-db';
  static const exerciseDbUrl = 'https://workouch-exercise-db.vercel.app';
  static const exerciseDbApiVersion = '/api/v1';
  static const exerciseDbApiKeyHeader = 'x-api-key';
  static const exerciseDbApiKeyEnv = 'EXERCISE_DB_API_KEY';

  // Errors
  static const networkError = 'Network error';
  static const commonError = 'Something went wrong';

  // Text
  static const appName = 'Workouch';
  static const workout = 'Workout';
  static const lazy = 'LAZY';
  static const lazyDescription = 'Let AI build a quick workout';
  static const pro = 'PRO';
  static const proDescription = 'You manage your workouts';
  static const weight = 'Weight';
  static const bmi = 'BMI';
  static const calories = 'Calories';
  static const workouts = 'Workouts';
  static const fullControl = 'Full control over your workouts';
  static const total = 'Total';
  static const mode = 'Mode';
  static const exercise = 'Exercise';
  static const exercises = 'Exercises';
  static const newWorkout = 'New workout';
  static const name = 'Name';
  static const nameHint = 'E.g. Chest Workout';
  static const restBetweenExercises = 'Rest between exercises';
  static const clearAll = 'Clear all';
  static const searchByName = 'Search by name';
  static const selectExercises = 'Select exercises';
  static const error = 'Error';
  static const close = 'Close';
  static const cancel = 'Cancel';
  static const confirm = 'Confirm';
  static const exerciseFilter = 'Exercise filter';
  static const muscle = 'Muscle';
  static const anyMuscle = 'Any muscle';
  static const equipment = 'Equipment';
  static const anyEquipment = 'Any equipment';
  static const retry = 'Retry';
  static const noExerciseFound = 'No exercise found';
  static const exerciseType = 'Exercise type';
  static const distance = 'Distance';
  static const time = 'Time';
  static const repsOnly = 'Reps only';
  static const reps = 'Reps';
  static const sets = 'Sets';
  static const mins = 'Mins';
  static const secs = 'Secs';
  static const kg = 'Kg';
  static const km = 'Km';
  static const meters = 'Meters';
  static const newSet = 'New set';
  static const restBetweenSets = 'Rest between sets';
  static const timeToRest = 'Time to rest';
  static const addExercise = 'Add exercise';
  static const updateExercise = 'Update exercise';
  static const delete = 'Delete';
  static const dragToReorder = 'Hold and drag to reorder, swipe to delete';
  static const noExerciseSelected = 'No exercise selected';
  static const invalidSets = 'All sets must be valid';
  static const noWorkoutFound = 'No workout found';
  static const workoutSavedSuccessfully = 'Workout saved successfully';
  static const workoutSavedError = 'Failed to save workout';
  static const workoutNotFound = 'Workout not found';
  static const pleaseEnterAWorkoutName = 'Please enter a workout name';
  static const pleaseAddAtLeastOneExercise = 'Please add at least one exercise';
  static const startWorkout = 'Start workout';
  static const update = 'Update';
  static const updateWorkout = 'Update workout';
  static const deleteWorkout = 'Delete workout';
  static const deleteWorkoutConfirmation =
      'Are you sure you want to delete this workout? This action cannot be undone.';
  static const workoutDeletedSuccessfully = 'Workout deleted successfully';
  static const workoutDeletedError = 'Failed to delete workout';
}

class _Supabase {
  String get url => dotenv.env['SUPABASE_URL'] ?? '';

  String get anonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? '';

  String get iosClientId => dotenv.env['GOOGLE_IOS_CLIENT_ID'] ?? '';

  String get webClientId => dotenv.env['GOOGLE_WEB_CLIENT_ID'] ?? '';

  String get tableWorkouts => 'workouts';

  String get tableWorkoutExercises => 'workout_exercises';
}

class _Time {
  List<int> get mins => [for (var i = 0; i < 60; i++) i];

  List<int> get secs => [for (var i = 0; i < 60; i++) i];

  int get searchDebounce => 500; // milliseconds
}
