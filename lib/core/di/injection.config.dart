// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/data/services/supabase_auth_service.dart' as _i738;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i723;
import '../../features/auth/domain/repositories/subscription_repo.dart'
    as _i240;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i9;
import '../../features/onboard/presentation/cubit/onboard_cubit.dart' as _i754;
import '../../features/settings/presentation/cubit/settings_cubit.dart'
    as _i792;
import '../../features/workout/data/services/exercise_service.dart' as _i747;
import '../../features/workout/data/services/supabase_workout_service.dart'
    as _i275;
import '../../features/workout/domain/repositories/ai_workout_repo.dart'
    as _i1018;
import '../../features/workout/domain/repositories/exercise_repo.dart' as _i275;
import '../../features/workout/domain/repositories/workout_repo.dart' as _i597;
import '../../features/workout/presentation/cubit/workout_cubit.dart' as _i645;
import '../../features/workout_session/data/services/supabase_workout_session_service.dart'
    as _i638;
import '../../features/workout_session/domain/repositories/workout_session_repo.dart'
    as _i885;
import '../../features/workout_session/presentation/cubit/workout_session_cubit.dart'
    as _i613;
import '../services/firebase_service.dart' as _i758;
import '../services/posthog_analytics_service.dart' as _i135;
import '../services/review_service.dart' as _i793;
import '../services/storage_service.dart' as _i306;
import '../services/subscription_service.dart' as _i833;
import '../services/version_service.dart' as _i999;
import 'injection.dart' as _i464;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final injectionModule = _$InjectionModule();
  gh.factory<_i754.OnboardCubit>(() => _i754.OnboardCubit());
  await gh.lazySingletonAsync<_i460.SharedPreferences>(
    () => injectionModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i999.VersionService>(() => _i999.VersionService());
  gh.lazySingleton<_i758.FirebaseService>(() => _i758.FirebaseService());
  gh.lazySingleton<_i135.PostHogAnalyticsService>(
    () => _i135.PostHogAnalyticsService(),
  );
  gh.lazySingleton<_i833.SubscriptionService>(
    () => _i833.SubscriptionService(),
  );
  gh.lazySingleton<_i638.SupabaseWorkoutSessionService>(
    () => _i638.SupabaseWorkoutSessionService(),
  );
  gh.lazySingleton<_i738.SupabaseAuthService>(
    () => _i738.SupabaseAuthService(),
  );
  gh.lazySingleton<_i275.SupabaseWorkoutService>(
    () => _i275.SupabaseWorkoutService(),
  );
  gh.lazySingleton<_i306.AppPrefs>(
    () => _i306.AppPrefs(gh<_i460.SharedPreferences>()),
  );
  gh.lazySingleton<_i723.AuthRepo>(
    () => _i723.AuthRepoImpl(
      gh<_i738.SupabaseAuthService>(),
      gh<_i135.PostHogAnalyticsService>(),
    ),
  );
  gh.lazySingleton<_i240.SubscriptionRepo>(
    () => _i240.SubscriptionRepoImpl(gh<_i833.SubscriptionService>()),
  );
  gh.lazySingleton<_i361.Dio>(
    () => injectionModule.dioExerciseDb,
    instanceName: 'exercise-db',
  );
  gh.factory<_i117.AuthCubit>(
    () => _i117.AuthCubit(gh<_i723.AuthRepo>(), gh<_i240.SubscriptionRepo>()),
  );
  gh.lazySingleton<_i306.StorageService>(
    () => _i306.StorageService(gh<_i306.AppPrefs>()),
  );
  gh.lazySingleton<_i885.WorkoutSessionRepo>(
    () =>
        _i885.WorkoutSessionRepoImpl(gh<_i638.SupabaseWorkoutSessionService>()),
  );
  gh.lazySingleton<_i597.WorkoutRepo>(
    () => _i597.WorkoutRepoImpl(gh<_i275.SupabaseWorkoutService>()),
  );
  gh.factory<_i792.SettingsCubit>(
    () => _i792.SettingsCubit(gh<_i999.VersionService>()),
  );
  gh.lazySingleton<_i793.ReviewService>(
    () => _i793.ReviewService(gh<_i306.StorageService>()),
  );
  gh.lazySingleton<_i747.ExerciseService>(
    () => _i747.ExerciseService(gh<_i361.Dio>(instanceName: 'exercise-db')),
  );
  gh.factory<_i9.HomeCubit>(
    () => _i9.HomeCubit(gh<_i885.WorkoutSessionRepo>()),
  );
  gh.factory<_i613.WorkoutSessionCubit>(
    () => _i613.WorkoutSessionCubit(gh<_i885.WorkoutSessionRepo>()),
  );
  gh.lazySingleton<_i275.ExerciseRepo>(
    () => _i275.ExerciseRepoImpl(gh<_i747.ExerciseService>()),
  );
  gh.lazySingleton<_i1018.AIWorkoutRepo>(
    () => _i1018.AIWorkoutRepoImpl(gh<_i747.ExerciseService>()),
  );
  gh.factory<_i645.WorkoutCubit>(
    () => _i645.WorkoutCubit(
      gh<_i275.ExerciseRepo>(),
      gh<_i597.WorkoutRepo>(),
      gh<_i1018.AIWorkoutRepo>(),
    ),
  );
  return getIt;
}

class _$InjectionModule extends _i464.InjectionModule {}
