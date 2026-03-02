import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  AppConstants._();

  // Class constants
  static final timeConst = _Time();
  static final supabase = _Supabase();
  static final url = _Url();
  static final posthog = _PostHog();
  static final humanMetrics = _HumanMetrics();

  // Exercise DB
  static const exerciseDb = 'exercise-db';
  static const exerciseDbUrl = 'https://api.vigorworkouch.com';
  static const exerciseDbApiVersion = '/api/v1';
  static const exerciseDbApiKeyHeader = 'x-api-key';
  static const exerciseDbApiKeyEnv = 'EXERCISE_DB_API_KEY';

  // Errors
  static const networkError = 'Network error';
  static const commonError = 'Something went wrong';

  // Main
  static const appName = 'Workouch';
  static const appVersion = '1.0.0';
  static const contactEmailAddress = 'vigor.workouch@gmail.com';

  // App
  static const workout = 'Workout';
  static const create = 'Create';
  static const createDescription = 'Build any workout with AI';
  static const manage = 'Manage';
  static const manageDescription = 'Manage all of your workouts';
  static const pro = 'PRO';
  static const weight = 'Weight';
  static const bmi = 'BMI';
  static const bmiYouAreIn = "You're in: ";
  static const bmiUnderweight = 'Underweight';
  static const bmiNormal = 'Normal';
  static const bmiOverweight = 'Overweight';
  static const bmiObese = 'Obese';
  static const bmiUnderweightInstruction =
      'Consider eating nutrient-dense foods to reach a healthy weight.';
  static const bmiNormalInstruction =
      "Great! You're in the healthy range. Keep up your habits.";
  static const bmiOverweightInstruction =
      'Consider more activity and balanced eating to improve health.';
  static const bmiObeseInstruction =
      'Consult a healthcare provider for a personalized plan.';
  static const calories = 'Calories';
  static const bodyMetrics = 'Body Metrics';
  static const fitnessMetrics = 'Fitness Metrics';
  static const protein = 'Protein';
  static const carb = 'Carb';
  static const fat = 'Fat';
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
  static const reset = 'Reset';
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
  static const lbs = 'Lbs';
  static const cm = 'Cm';
  static const inch = 'In';
  static const ft = 'Ft';
  static const kcal = 'Kcal';
  static const km = 'Km';
  static const meters = 'Meters';
  static const miles = 'Miles';
  static const measurementSystem = 'Measurement System';
  static const metricDescription = 'kg, cm';
  static const imperialDescription = 'lbs, in';
  static const metric = 'Metric';
  static const imperial = 'Imperial';
  static const newSet = 'New set';
  static const restBetweenSets = 'Rest between sets';
  static const timeToRest = 'Time to rest';
  static const addExercise = 'Add exercise';
  static const updateExercise = 'Update exercise';
  static const delete = 'Delete';
  static const dragToReorder = 'Hold and drag to reorder, swipe to delete';
  static const noExerciseSelected = 'No exercise selected';
  static const invalidSets = 'Please fill in data for all sets';
  static const buildFirstWorkout = 'Let\'s build your first workout';
  static const workoutSavedSuccessfully = 'Workout saved successfully';
  static const workoutSavedError = 'Failed to save workout';
  static const workoutNotFound = 'Workout not found';
  static const pleaseEnterAWorkoutName = 'Please enter a workout name';
  static const pleaseAddAtLeastOneExercise = 'Please add at least one exercise';
  static const startWorkout = 'Start workout';
  static const savingWorkout = 'Saving workout...';
  static const update = 'Update';
  static const updateWorkout = 'Update workout';
  static const deleteWorkout = 'Delete workout';
  static const deleteWorkoutConfirmation =
      'Are you sure you want to delete this workout? This action cannot be undone.';
  static const workoutDeletedSuccessfully = 'Workout deleted successfully';
  static const workoutDeletedError = 'Failed to delete workout';
  static const workoutSessionSavedError = 'Failed to save workout session';
  static const exercisePersonalRecordSavedError =
      'Failed to save exercise personal record';
  static const signInSubtitle = 'Sign in to continue';
  static const pleaseSignIn = 'Please sign in to continue';
  static const signingIn = 'Signing in...';
  static const loading = 'Loading...';
  static const continueWithGoogle = 'Continue with Google';
  static const continueWithApple = 'Continue with Apple';
  static const continueWithEmail = 'Continue with Email';
  static const email = 'Email';
  static const password = 'Password';
  static const emailHint = 'Enter your email';
  static const passwordHint = 'Enter your password';
  static const pleaseEnterYourEmail = 'Please enter your email';
  static const pleaseEnterAValidEmail = 'Please enter a valid email';
  static const pleaseEnterYourPassword = 'Please enter your password';
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
  static const tenSecs = '10s';
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
  static const workoutBuilder = 'Workout Builder';
  static const letAiPlanWorkoutForYou = 'Let AI plan a workout for you';
  static const intensity = 'Intensity';
  static const targetBodyParts = 'Target Body Parts';
  static const availableEquipments = 'Available Equipments';
  static const numberOfExercises = 'Number of Exercises';
  static const buildYourWorkout = 'Build Your Workout';
  static const startBuilding = 'Start Building';
  static const buildingWorkout = 'Building your workout...';
  static const includeMyData = 'Include my data';
  static const includeMyDataInfo =
      'When this is on, we use your data like height, weight, age, gender, activity level, and any injuries or limitations to better personalize your AI-generated workout.';
  static const workoutGenerated = 'Workout generated successfully';
  static const workoutGenerationError = 'Failed to generate workout';
  static const discardChanges = 'Discard changes';
  static const discardChangesMessage =
      'Are you sure you want to discard your changes? Your workout will not be saved';
  static const iUnderstood = 'I understood';
  static const aiWorkoutUsage = 'AI workout usage';
  // AI Workout Generation Messages
  static const List<String> aiGenerationMessages = [
    'Analyzing your preferences...',
    'Selecting exercises...',
    'Creating workout structure...',
    'Optimizing sets and reps...',
    'Calculating rest times...',
    'Fine-tuning your workout...',
    'Almost ready...',
  ];
  static const lowIntensity = 'Low';
  static const mediumIntensity = 'Medium';
  static const highIntensity = 'High';
  static const selectBodyParts = 'Select Body Parts';
  static const selectEquipments = 'Select Equipments';
  static const anyBodyPart = 'Any body part';
  // Location options
  static const location = 'Location';
  static const selectLocation = 'Select Location';
  static const anyLocation = 'Any location';
  static const locationRoom = 'Room (small space)';
  static const locationGarageBackyard = 'Garage/Backyard';
  static const locationCommercialGym = 'Commercial Gym';
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
  static const theShuffleMode = '"The Shuffle"';
  static const theNeatMode = '"The Neat"';
  static const shuffleModeDescription =
      'Describe your preferences, goals, or anything...';
  static const workoutPreferencesHint =
      'E.g. I have 30 minutes and a pair of dumbbells. Surprise me';
  static const pleaseEnterWorkoutPref = 'Please enter your workout preferences';
  static const subscriptionPlans = 'Subscription Plans';
  static const settings = 'Settings';
  static const account = 'Account';
  static const deleteAccount = 'Delete Account';
  static const deleteAccountConfirmation =
      'Are you sure you want to delete your account? This action cannot be undone.';
  static const legal = 'Legal';
  static const termsConditions = 'Terms & Conditions';
  static const privacyPolicy = 'Privacy Policy';
  static const support = 'Support';
  static const about = 'About';
  static const contactUs = 'Contact Us';
  static const version = 'Version';
  static const website = 'Website';
  static const feedback = 'Feedback';
  static const feedbackDescription = 'Send us your feedback';
  static const responseTime = 'Response Time';
  static const responseTimeDescription =
      'We typically respond within 24-48 hours. For urgent issues, please mark your email as "Urgent" in the subject line.';
  static const workingHours = 'Working Hours';
  static const workingHoursDescription =
      'Monday - Friday: 9:00 AM - 6:00 PM (UTC)\nWeekend: Limited availability';
  static const unlock = 'Unlock';
  static const enjoyUnlimitedAccess = 'Enjoy unlimited access to all features';
  static const noChargesYetCancelAnytime = 'No charges yet. Cancel anytime';
  static const restorePurchase = 'Restore Purchase';
  static const continueText = 'Continue';
  static const mostPopular = 'Most Popular';
  // History
  static const thisWeek = 'This Week';
  static const thisMonth = 'This Month';
  static const history = 'History';
  static const weekStreak = 'Week Streak';
  static const weekStreakExplanation =
      'Weeks in a row you completed at least one workout. Do one workout per week to keep your streak.';
  static const selectMonthYear = 'Select Month & Year';
  static const today = 'Today';
  static const select = 'Select';
  static const noWorkoutsYet = 'No workouts yet';
  static const trainingVolume = 'Volume';
  static const totalLoadKg = 'Total load (kg)';
  static const newPrsThisMonth = 'New PRs this month';
  static const totalPRs = 'Total PRs';
  static const weightPRs = 'Weight PRs';
  static const repsPRs = 'Reps PRs';
  static const thisYear = 'This Year';
  // Personal Records
  static const personalRecords = 'Personal Records';
  static const allPRs = 'All PRs';
  static const pr = 'PR';
  static const all = 'All';
  static const newPRs = 'New PRs';
  static const featured = 'Featured';
  static const featuredExercises = 'Featured Exercises';
  static const selectedExercises = 'Selected Exercises';
  static const addExercisePR = 'Add Exercise';
  static const viewAll = 'View All';
  static const maxWeight = 'Max Weight';
  static const prDate = 'PR Date';
  static const noPRsYet = 'No PRs yet';
  static const selectFeaturedExercises =
      'Select any exercise to show as featured here';
  static const bestPRsInEachExercise =
      'Your best PRs achieved in each exercise';
  static const selected = 'Selected';
  static const remove = 'Remove';
  static const edit = 'Edit';
  static const topExercises = 'Top Exercises';
  static const unlimitedWorkoutGeneration =
      'Unlimited AI-powered workout generation';
  static const advancedProgressTrackingAnalytics =
      'Advanced progress tracking & analytics';
  static const comprehensiveBodyStatsInsights =
      'Comprehensive body stats & insights';
  static const allFutureUpdatesIncluded = 'All future updates included';
  static const purchaseSuccess = 'Subscription purchased successfully';
  static const purchaseError =
      'Failed to proceed with purchase. Please try again.';
  static const restoreSuccess = 'Subscription restored successfully';
  static const restoreError =
      'Failed to restore subscription. Please try again.';
  static const userSubscriptionNotFound = 'Failed to get user subscription';
  static const upgradeToPro = 'Upgrade to Pro';
  static const upgradeToProMessage =
      'You\'ve reached your workout generation limit. Upgrade to Pro for unlimited AI workout generation!';
  static const goToSubscription = 'View Plans';
  static const maybeLater = 'Maybe Later';
  static const limitExceeded = 'Limit Exceeded';
  static const limitExceededMessage =
      'You\'ve used all of your workout generations for this month. Please wait until';
  static const incrementWorkoutGenUsedFailed =
      'Failed to update workout generation count';
  static const resetSubscriptionPeriodFailed =
      'Failed to reset subscription period';
  static const updateUserSubscriptionFailed =
      'Failed to update user subscription';
  static const getStarted = 'Get Started';
  static const skip = 'Skip';
  // Onboarding Introduction Features
  static const onboardFeature1Title =
      'Stop spending hours planning your workouts';
  static const onboardFeature1Description =
      'Let AI create your perfect workout plan in seconds';
  static const onboardFeature2Title =
      'Get personalized routines, tailored for you';
  static const onboardFeature2Description =
      'Workouts designed based on your goals, fitness level, and preferences';
  static const onboardFeature3Title = 'Be the best version of yourself';
  static const onboardFeature3Description =
      'Stay consistent and motivated with smart workout plans';
  static const onboardFeature4Title = 'Know your data, track your progress';
  static const onboardFeature4Description =
      'Monitor your fitness journey with detailed analytics and insights';
  static const onboardFeature5Title = 'Full list of exercises';
  static const onboardFeature5Description =
      'Access comprehensive exercise database with instructions and variations';
  static const pleaseFillInAllRequiredInformation =
      'Please fill in all required information';
  static const pleaseEnterValidValues = 'Please enter valid values';

  // Onboarding sample routine
  static const onboardSampleRoutineName = 'Chest Workout';
  static const onboardSampleRoutineExerciseCount = 2;
  static const onboardSampleExercise1Name = 'Cable Cross Over';
  static const onboardSampleExercise1Info = 'Chest > Cable';
  static const onboardSampleExercise2Name = 'Decline Cable Push';
  static const onboardSampleExercise2Info = 'Chest > Cable';

  // Onboarding testimonials
  static const onboardTestimonial1UserName = 'James K.';
  static const onboardTestimonial1Feedback =
      '"Best workout app I\'ve ever tried! The AI builds perfect routines for my busy schedule"';
  static const onboardTestimonial2UserName = 'David R.';
  static const onboardTestimonial2Feedback =
      '"Incredible results in just weeks! Got my PRs in big compound exercises"';
  static const onboardTestimonial3UserName = 'Emma L.';
  static const onboardTestimonial3Feedback =
      '"Love how personalized the workouts are. I\'ve never been more consistent!"';

  // Onboarding analytics
  static const onboardAnalyticsTitle = 'Weekly Progress';
  static const onboardAnalyticsWeightValue = '72.5 kg';
  static const onboardAnalyticsWeightChange = '+0.8 kg';
  static const onboardAnalyticsBmiValue = '23.1';
  static const onboardAnalyticsBmiChange = '+0.2';
  static const onboardAnalyticsWorkoutsValue = '12';
  static const onboardAnalyticsWorkoutsChange = '+3';
  static const onboardAnalyticsWorkoutFrequency = 'Workout Frequency';
  static const onboardAnalyticsGoalProgress = 'Goal Progress';
  static const onboardAnalyticsConsistency = 'Consistency';

  // Onboarding main pages
  static const onboardMeasurementSystemTitle =
      'Your preferred measurement system?';
  static const onboardMeasurementSystemDescription =
      'Choose between Metric (cm, kg) or Imperial (ft, lbs). You can change this later in your profile.';
  static const onboardGenderTitle = 'What\'s your gender?';
  static const onboardGenderDescription =
      'This helps us personalize your workout plan';
  static const onboardAgeTitle = 'How old are you?';
  static const onboardAgeDescription =
      'This helps us calculate your optimal workout intensity';
  static const onboardHeightTitle = 'What\'s your height?';
  static const onboardHeightDescription =
      'This helps us calculate your metrics';
  static const onboardWeightTitle = 'What\'s your weight?';
  static const onboardWeightDescription =
      'This helps us calculate your metrics';
  static const onboardActivityLevelTitle = 'How active are you?';
  static const onboardActivityLevelDescription =
      'This helps us plan the best workout routines for you';
  static const completeSetup = 'Complete Setup';
  static const finish = 'Finish';
  static const settingUp = 'Setting up...';
  static const settingUpSuccess = 'Setup completed successfully';
  static const settingUpError = 'Failed to complete setup';

  // Review
  static const reviewTitle = 'Love Workouch?';
  static const reviewDescription =
      'We would love to hear your thoughts on how we can make Workouch better';
  static const rateUs = 'Rate Us';
  static const doNotAskAgain = 'Do not ask again';
}

class _Supabase {
  String get url => dotenv.env['SUPABASE_URL'] ?? '';

  String get anonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? '';

  String get iosClientId => dotenv.env['GOOGLE_IOS_CLIENT_ID'] ?? '';

  String get webClientId => dotenv.env['GOOGLE_WEB_CLIENT_ID'] ?? '';

  String get tableWorkouts => 'workouts';

  String get tableWorkoutExercises => 'workout_exercises';

  String get tableUsers => 'users';

  String get tableUserSubscription => 'user_subscription';

  String get tableWorkoutSessions => 'workout_sessions';

  String get tableWorkoutSessionExercises => 'workout_session_exercises';

  String get tableExercisePersonalRecords => 'exercise_personal_records';

  String get tableUserWorkoutWeeks => 'user_workout_weeks';
}

class _Time {
  List<int> get mins => [for (var i = 0; i < 60; i++) i];

  List<int> get secs => [for (var i = 0; i < 60; i++) i];

  int get searchDebounce => 500; // milliseconds
}

class _Url {
  String get appStore =>
      'https://apps.apple.com/app/workouch-ai-workout-planner/id6756765073';

  String get playStore =>
      'https://play.google.com/store/apps/details?id=com.vigor.workouch';

  String get formDeleteAccount => 'https://forms.gle/zgemJjqtUz4HqL6J7';

  String get pageTermsConditions =>
      'https://vigorworkouch.com/terms-conditions';

  String get pagePrivacyPolicy => 'https://vigorworkouch.com/privacy-policy';

  String get pageSupport => 'https://vigorworkouch.com/support';

  String get pageFeedback => 'https://vigorworkouch.com/#get-in-touch';

  String get website => 'https://vigorworkouch.com';

  String get contactEmail => 'mailto:vigor.workouch@gmail.com';
}

class _PostHog {
  String get apiKey => dotenv.env['POSTHOG_API_KEY'] ?? '';
  String get host => dotenv.env['POSTHOG_HOST'] ?? 'https://us.i.posthog.com';
}

class _HumanMetrics {
  int get minHeightCm => 50;

  int get maxHeightCm => 300;

  int get minHeightFt => 1;

  int get maxHeightFt => 9;

  int get minHeightInch => 0;

  int get maxHeightInch => 11;

  int get minWeightKg => 20;

  int get maxWeightKg => 300;

  int get minWeightLbs => 45;

  int get maxWeightLbs => 650;

  double get defaultHeightCm => 170.0;

  double get defaultWeightKg => 70.0;

  List<int> get availableAges => List.generate(91, (index) => index + 10);

  int getAgeIndex(int? age) {
    if (age == null) return 0;
    final index = availableAges.indexOf(age);
    return index >= 0 ? index : 0;
  }
}
