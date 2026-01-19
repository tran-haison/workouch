import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../workout/domain/entities/exercise.dart';
import '../../../workout/domain/entities/working_exercise.dart';
import '../../../workout/presentation/cubit/workout_cubit.dart';
import '../../../workout/presentation/cubit/workout_state.dart';
import '../../../workout/presentation/dialogs/exercise_details_dialog.dart';
import '../../../workout/presentation/widgets/exercise_card_item.dart';

class ExercisesTab extends StatelessWidget {
  const ExercisesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: BlocBuilder<WorkoutCubit, WorkoutState>(
        builder: (context, state) {
          if (state.getExercisesStatus == WorkoutStateStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.exercises.isEmpty) {
            return Center(
              child: Text(
                'No exercises found',
                style: AppTextStyles.h4.copyWith(color: AppColors.mediumGray),
              ),
            );
          }

          return GridView.builder(
            padding: EdgeInsets.only(
              top: 20.h,
              bottom: 100.h,
              left: 20.w,
              right: 20.w,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: 0.85,
            ),
            itemCount: state.exercises.length,
            itemBuilder: (context, index) {
              final exercise = state.exercises[index];
              return ExerciseCardItem(
                exercise: exercise,
                onTap: () => _showExerciseDetails(context, exercise),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _showExerciseDetails(
    BuildContext context,
    Exercise exercise,
  ) async {
    await ExerciseDetailsDialog.showToAdd(
      context,
      workingExercise: WorkingExercise.fromExercise(exercise),
    );
  }
}
