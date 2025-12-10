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
  static const set = 'Set';
  static const mins = 'Mins';
  static const secs = 'Secs';
  static const kg = 'Kg';
  static const cm = 'Cm';
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
  static const addFirstWorkout = 'Add your first workout';
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
  static const signInSubtitle = 'Sign in to continue';
  static const loading = 'Loading...';
  static const continueWithGoogle = 'Continue with Google';
  static const continueWithApple = 'Continue with Apple';
  static const signInSuccess = 'Signed in successfully';
  static const signInError = 'Failed to sign in. Please try again.';
  static const userNotFound = 'User not found';
  static const readyToStart = 'Ready to start?';
  static const readyToStartDescription =
      'Make sure you\'re prepared and have everything you need';
  static const letsGo = 'Let\'s go!';
  static const next = 'Next';
  static const previous = 'Previous';
  static const finishWorkout = 'Finish workout';
  static const finishWorkoutMessage =
      'Finish your workout? Your progress will be saved.';
  static const exitWorkout = 'Exit workout';
  static const exitWorkoutMessage =
      'Are you sure you want to exit this workout? Your progress will not be saved.';
  static const restTime = 'Rest time';
  static const skipRest = 'Skip rest';
  static const youHaveCompleted = 'You have completed';
  static const backToHome = 'Back to Home';
  static const duration = 'Duration';
  static const plusTenSecs = '+ 10s';
  static const minusTenSecs = '- 10s';
  static const description = 'Description';
  static const targetMuscles = 'Target Muscles';
  static const secondaryMuscles = 'Secondary Muscles';
  static const bodyParts = 'Body Parts';
  static const instructions = 'Instructions';
  static const profile = 'Profile';
  static const personalInformation = 'Personal Information';
  static const healthMetrics = 'Health Metrics';
  static const age = 'Age';
  static const years = 'years';
  static const gender = 'Gender';
  static const height = 'Height';
  static const signOut = 'Sign Out';
  static const updateProfileSuccess = 'Profile updated successfully';
  static const updateProfileError = 'Failed to update profile';
  static const pleaseEnterYourAge = 'Please enter your age';
  static const pleaseEnterAValidAge = 'Please enter a valid age';
  static const pleaseEnterYourHeight = 'Please enter your height';
  static const pleaseEnterAValidHeight = 'Please enter a valid height';
  static const pleaseEnterYourWeight = 'Please enter your weight';
  static const pleaseEnterAValidWeight = 'Please enter a valid weight';
  static const enterYourAge = 'Enter your age';
  static const enterYourHeight = 'Enter your height';
  static const enterYourWeight = 'Enter your weight';
  static const male = 'Male';
  static const female = 'Female';
  static const updateProfile = 'Update profile';
  static const activityLevel = 'Activity Level';
  static const activityLevelTitleSedentary = 'Sedentary';
  static const activityLevelTitleLightlyActive = 'Lightly Active';
  static const activityLevelTitleModeratelyActive = 'Moderately Active';
  static const activityLevelTitleVeryActive = 'Very Active';
  static const activityLevelTitleExtremelyActive = 'Extremely Active';
  static const activityLevelSedentary = 'Little or no exercise';
  static const activityLevelLightlyActive = 'Light exercise 1-3 days/week';
  static const activityLevelModeratelyActive =
      'Moderate exercise 3-5 days/week';
  static const activityLevelVeryActive = 'Hard exercise 6-7 days/week';
  static const activityLevelExtremelyActive =
      'Very hard exercise, physical job';
  static const tdee = 'TDEE';
  static const aiWorkoutBuilder = 'AI Workout Builder';
  static const workoutPreferences = 'Workout Preferences';
  static const intensity = 'Intensity';
  static const targetBodyParts = 'Target Body Parts';
  static const availableEquipments = 'Available Equipments';
  static const numberOfExercises = 'Number of Exercises';
  static const generateWorkout = 'Generate Workout';
  static const generatingWorkout = 'Generating your workout...';
  static const workoutGenerated = 'Workout generated successfully';
  static const workoutGenerationError = 'Failed to generate workout';
  static const lowIntensity = 'Low';
  static const mediumIntensity = 'Medium';
  static const highIntensity = 'High';
  static const selectBodyParts = 'Select Body Parts';
  static const selectEquipments = 'Select Equipments';
  static const anyBodyPart = 'Any body part';
  static const anyEquipmentType = 'Any equipment';
  // Location options
  static const location = 'Location';
  static const selectLocation = 'Select Location';
  static const anyLocation = 'Any location';
  static const locationLivingRoom = 'Living room (small space)';
  static const locationGarageBackyard = 'Garage/Backyard (jumping allowed)';
  static const locationCommercialGym = 'Commercial Gym';
  static const locationHotelRoom = 'Hotel Room';
  static const locationOutdoorsPark = 'Outdoors/Park';
  // Workout Goals
  static const workoutGoals = 'Workout Goals';
  static const selectYourGoals = 'Select Your Goals';
  static const anyGoal = 'Any goal';
  static const goalStrength = 'Strength';
  static const goalHypertrophy = 'Hypertrophy/Muscle Growth';
  static const goalEndurance = 'Endurance';
  static const goalFatLoss = 'Fat Loss/HIIT';
  static const goalMobility = 'Mobility/Recovery';
  // Injuries/Limitations
  static const injuriesLimitations = 'Injuries/Limitations';
  static const injuriesLimitationsHint =
      'E.g. Lower back pain, knee injury, etc.';
  // Tabs
  static const simpleMode = 'Simple';
  static const advancedMode = 'Advanced';
  static const workoutPreferencesHint =
      'E.g. 30 min full body workout, focus on strength, no equipment...';
}

class _Supabase {
  String get url => dotenv.env['SUPABASE_URL'] ?? '';

  String get anonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? '';

  String get iosClientId => dotenv.env['GOOGLE_IOS_CLIENT_ID'] ?? '';

  String get webClientId => dotenv.env['GOOGLE_WEB_CLIENT_ID'] ?? '';

  String get tableWorkouts => 'workouts';

  String get tableWorkoutExercises => 'workout_exercises';

  String get tableUsers => 'users';
}

class _Time {
  List<int> get mins => [for (var i = 0; i < 60; i++) i];

  List<int> get secs => [for (var i = 0; i < 60; i++) i];

  int get searchDebounce => 500; // milliseconds
}
