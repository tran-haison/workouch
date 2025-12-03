import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workouch/features/workout/domain/entities/working_exercise.dart';

import '../../../../core/widgets/common_gaps.dart';
import '../cubit/workout_session_cubit.dart';
import '../cubit/workout_session_state.dart';
import 'workout_set_item.dart';

class WorkoutSetList extends StatelessWidget {
  const WorkoutSetList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutSessionCubit, WorkoutSessionState>(
      builder: (context, state) {
        final sets = state.currentExercise.separatedSets;
        final currSetIdx = state.currentSetIndex;

        return ListView.separated(
          itemCount: sets.length,
          itemBuilder: (_, i) => WorkoutSetItem(
            setIndex: i,
            set: sets[i],
            isCompleted: i < currSetIdx,
            isCurrent: i == currSetIdx,
            onComplete: () {
              context.read<WorkoutSessionCubit>().goNextSet();
            },
          ),
          separatorBuilder: (_, _) => Gaps.vGap20,
        );
      },
    );
  }
}
