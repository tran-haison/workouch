import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workouch/features/workout/domain/entities/working_exercise.dart';

import '../../../../core/widgets/common_gaps.dart';
import '../cubit/workout_session_cubit.dart';
import '../cubit/workout_session_state.dart';
import 'workout_set_item.dart';

class WorkoutSetList extends StatelessWidget {
  const WorkoutSetList({required this.onCompleteCurrentSet, super.key});

  final VoidCallback onCompleteCurrentSet;

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
            onComplete: onCompleteCurrentSet,
          ),
          separatorBuilder: (_, _) => Gaps.vGap8,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
        );
      },
    );
  }
}
