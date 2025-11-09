class AppConstants {
  AppConstants._();

  // Class constants
  static final timeConst = _Time();

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
}

class _Time {
  List<int> get mins => [for (var i = 0; i < 60; i++) i];

  List<int> get secs => [for (var i = 0; i < 60; i++) i];

  int get searchDebounce => 500; // milliseconds
}
