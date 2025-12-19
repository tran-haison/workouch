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
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
import '../../features/workout/data/services/exercise_service.dart' as _i747;
import '../../features/workout/data/services/supabase_workout_service.dart'
    as _i275;
import '../../features/workout/domain/repositories/ai_workout_repo.dart'
    as _i1018;
import '../../features/workout/domain/repositories/exercise_repo.dart' as _i275;
import '../../features/workout/domain/repositories/workout_repo.dart' as _i597;
import '../../features/workout/presentation/cubit/workout_cubit.dart' as _i645;
import '../../features/workout_session/presentation/cubit/workout_session_cubit.dart'
    as _i613;
import '../services/firebase_service.dart' as _i758;
import 'injection.dart' as _i464;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final injectionModule = _$InjectionModule();
  gh.factory<_i613.WorkoutSessionCubit>(() => _i613.WorkoutSessionCubit());
  await gh.lazySingletonAsync<_i460.SharedPreferences>(
    () => injectionModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i275.SupabaseWorkoutService>(
    () => _i275.SupabaseWorkoutService(),
  );
  gh.lazySingleton<_i738.SupabaseAuthService>(
    () => _i738.SupabaseAuthService(),
  );
  gh.lazySingleton<_i758.FirebaseService>(() => _i758.FirebaseService());
  gh.lazySingleton<_i361.Dio>(
    () => injectionModule.dioExerciseDb,
    instanceName: 'exercise-db',
  );
  gh.lazySingleton<_i723.AuthRepo>(
    () => _i723.AuthRepoImpl(gh<_i738.SupabaseAuthService>()),
  );
  gh.lazySingleton<_i597.WorkoutRepo>(
    () => _i597.WorkoutRepoImpl(gh<_i275.SupabaseWorkoutService>()),
  );
  gh.lazySingleton<_i747.ExerciseService>(
    () => _i747.ExerciseService(gh<_i361.Dio>(instanceName: 'exercise-db')),
  );
  gh.factory<_i117.AuthCubit>(() => _i117.AuthCubit(gh<_i723.AuthRepo>()));
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
