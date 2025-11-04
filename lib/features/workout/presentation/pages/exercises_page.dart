import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../core/widgets/common_text_field.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/exercise_filter.dart';
import '../widgets/exercise_filter_dialog.dart';
import '../widgets/exercise_list_item.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({super.key});

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  final Set<int> _selectedExercises = <int>{};
  var _filter = ExerciseFilter(muscle: '', equipment: '');

  final List<Map<String, String>> _exercises = const [
    {'name': 'Barbell bench press', 'group': 'Chest > Barbell'},
    {'name': 'Dumbbell incline press', 'group': 'Chest > Dumbbell'},
    {'name': 'Pull ups', 'group': 'Back > Bodyweight'},
    {'name': 'Barbell back squat', 'group': 'Legs > Barbell'},
    {'name': 'Romanian deadlift', 'group': 'Legs > Barbell'},
  ];

  void _clearAll() {
    setState(() {
      _selectedExercises.clear();
      _filter = ExerciseFilter(muscle: '', equipment: '');
    });
  }

  void _toggleExercise(int index) {
    setState(() {
      if (_selectedExercises.contains(index)) {
        _selectedExercises.remove(index);
      } else {
        _selectedExercises.add(index);
      }
    });
  }

  void _showSelectedExercisesDialog() {
    // TODO: Implement dialog to show selected exercises
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Selected Exercises (${_selectedExercises.length})'),
        content: const Text('Dialog will be implemented later'),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      CommonIconButton(
                        backgroundColor: AppColors.grayBlue,
                        icon: Assets.icons.close,
                        iconColor: AppColors.black,
                        onTap: () {
                          context.pop();
                        },
                      ),
                      const Spacer(),
                      CommonButton(
                        isFullWidth: false,
                        text: AppConstants.clearAll,
                        onPressed: _clearAll,
                        textStyle: AppTextStyles.h4.copyWith(
                          color: AppColors.text,
                          fontWeight: FontWeight.w600,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 8.h,
                        ),
                        backgroundColor: AppColors.transparent,
                      ),
                    ],
                  ),
                  Gaps.vGap20,
                  Row(
                    children: [
                      Text(
                        AppConstants.selectExercises,
                        style: AppTextStyles.h0,
                      ),
                    ],
                  ),
                  Gaps.vGap20,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CommonTextField(
                          hintText: AppConstants.searchByName,
                          backgroundColor: AppColors.grayBlue,
                          prefix: CommonAssetIcon(
                            Assets.icons.search,
                            width: 20.r,
                            height: 20.r,
                            color: AppColors.black,
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                      Gaps.hGap10,
                      CommonIconButton(
                        icon: Assets.icons.filter,
                        iconColor: AppColors.black,
                        iconSize: 20.r,
                        backgroundColor: _filter.hasAnyFilter
                            ? AppColors.secondary
                            : AppColors.grayBlue,
                        onTap: _showExerciseFilterDialog,
                      ),
                    ],
                  ),
                  Gaps.vGap16,
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.only(bottom: 80.h),
                      itemBuilder: (context, index) {
                        final ex = _exercises[index];
                        final isSelected = _selectedExercises.contains(index);
                        return ExerciseListItem(
                          title: ex['name']!,
                          subtitle: ex['group']!,
                          isSelected: isSelected,
                          onTap: () => _toggleExercise(index),
                        );
                      },
                      separatorBuilder: (context, index) => Gaps.vGap12,
                      itemCount: _exercises.length,
                    ),
                  ),
                ],
              ),
            ),
            if (_selectedExercises.isNotEmpty)
              Positioned(
                bottom: 10.h,
                right: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary,
                            blurRadius: 10.r,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: CommonButton(
                        isFullWidth: false,
                        text:
                            '${_selectedExercises.length} ${AppConstants.exercises.toLowerCase()}',
                        backgroundColor: AppColors.primary,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        onPressed: _showSelectedExercisesDialog,
                        textStyle: AppTextStyles.h5,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _showExerciseFilterDialog() async {
    final filter = await showExerciseFilterDialog(
      context,
      muscles: ['Muscle 1', 'Muscle 2', 'Muscle 3'],
      equipments: ['Equipment 1', 'Equipment 2', 'Equipment 3'],
      initialFilter: _filter,
    );

    if (mounted && filter is ExerciseFilter) {
      setState(() {
        _filter = filter;
      });
    }
  }
}
