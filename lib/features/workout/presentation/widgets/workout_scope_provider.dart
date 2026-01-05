import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../cubit/workout_cubit.dart';

/// Widget that provides a shared [WorkoutCubit] instance for all workout-related pages.
/// This ensures that all workout pages share the same state.
///
/// This widget is used as a parent route wrapper in GoRouter to provide the cubit
/// to all child workout routes.
class WorkoutScopeProvider extends StatefulWidget {
  const WorkoutScopeProvider({super.key, required this.child});

  final Widget child;

  @override
  State<WorkoutScopeProvider> createState() => _WorkoutScopeProviderState();
}

class _WorkoutScopeProviderState extends State<WorkoutScopeProvider> {
  late final WorkoutCubit _workoutCubit;

  @override
  void initState() {
    super.initState();
    // Create the cubit instance when the scope is created
    _workoutCubit = getIt<WorkoutCubit>();
  }

  @override
  void dispose() {
    // Close the cubit when the scope is disposed
    _workoutCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkoutCubit>.value(
      value: _workoutCubit,
      child: widget.child,
    );
  }
}
