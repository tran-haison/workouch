import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../workout/domain/entities/workout.dart';
import '../cubit/workout_session_cubit.dart';

/// Widget that provides a [WorkoutSessionCubit] instance for workout session pages.
/// This ensures that workout session pages have access to the workout state.
class WorkoutSessionScopeProvider extends StatefulWidget {
  const WorkoutSessionScopeProvider({
    super.key,
    required this.child,
    this.workout,
  });

  final Workout? workout;
  final Widget child;

  @override
  State<WorkoutSessionScopeProvider> createState() =>
      _WorkoutSessionScopeProviderState();
}

class _WorkoutSessionScopeProviderState
    extends State<WorkoutSessionScopeProvider> {
  late final WorkoutSessionCubit _workoutSessionCubit;

  @override
  void initState() {
    super.initState();
    _workoutSessionCubit = getIt<WorkoutSessionCubit>();
    if (widget.workout != null) {
      _workoutSessionCubit.initWorkout(widget.workout!);
    }
    final authState = context.read<AuthCubit>().state;
    _workoutSessionCubit.initUser(authState.currentUser);
  }

  @override
  void dispose() {
    _workoutSessionCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkoutSessionCubit>.value(
      value: _workoutSessionCubit,
      child: widget.child,
    );
  }
}
