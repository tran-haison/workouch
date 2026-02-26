import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workouch/features/auth/domain/entities/user.dart';
import 'package:workouch/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:workouch/features/auth/presentation/cubit/auth_state.dart';

import '../../../../core/extension/duration_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../core/widgets/common_images.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/working_exercise.dart';
import '../../domain/entities/working_set.dart';

class WorkoutExerciseCard extends StatefulWidget {
  const WorkoutExerciseCard({
    super.key,
    required this.workingExercise,
    this.onSelected,
  });

  final WorkingExercise workingExercise;
  final VoidCallback? onSelected;

  @override
  State<WorkoutExerciseCard> createState() => _WorkoutExerciseCardState();
}

class _WorkoutExerciseCardState extends State<WorkoutExerciseCard>
    with TickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _pressController;
  late AnimationController _expandController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();
    _pressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 30),
    );
    _expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: _pressController, curve: Curves.easeInOut),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _expandController, curve: Curves.easeInOut),
    );

    _heightAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _expandController, curve: Curves.easeInOut),
    );
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _expandController.forward();
      } else {
        _expandController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _pressController.dispose();
    _expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exercise = widget.workingExercise;

    return GestureDetector(
      onTapDown: (_) => _pressController.forward(),
      onTapUp: (_) {
        _pressController.reverse();
        widget.onSelected?.call();
      },
      onTapCancel: () => _pressController.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColors.grayBlue, width: 1.r),
                    ),
                    child: CommonNetworkImage(
                      url: exercise.gifUrl,
                      width: 60.r,
                      height: 60.r,
                      backgroundColor: AppColors.transparent,
                    ),
                  ),
                  Gaps.hGap12,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exercise.name,
                          style: AppTextStyles.h4.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Gaps.vGap4,
                        Text(
                          exercise.displayMainInfo,
                          style: AppTextStyles.h5.copyWith(
                            color: AppColors.mediumGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              BlocBuilder<AuthCubit, AuthState>(
                buildWhen: (prev, curr) =>
                    prev.currentUser?.measurementSystem !=
                    curr.currentUser?.measurementSystem,
                builder: (context, state) {
                  final system =
                      state.currentUser?.measurementSystem ??
                      MeasurementSystem.metric;
                  final displaySetsInfo = exercise.displaySetsInfo(system);

                  return ClipRect(
                    child: SizeTransition(
                      sizeFactor: _heightAnimation,
                      axisAlignment: -1.0,
                      child: FadeTransition(
                        opacity: _heightAnimation,
                        child: Column(
                          children: [
                            if (displaySetsInfo.isNotEmpty) ...[
                              Gaps.vGap8,
                              ...displaySetsInfo.map((setInfo) {
                                return Padding(
                                  padding: EdgeInsets.only(top: 8.h),
                                  child: Row(
                                    children: [
                                      CommonAssetIcon(
                                        _getSetIcon(exercise.effectiveSetType),
                                        width: 16.r,
                                        height: 16.r,
                                        color: AppColors.black,
                                      ),
                                      Gaps.hGap10,
                                      Expanded(
                                        child: Text(
                                          setInfo,
                                          style: AppTextStyles.h5,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ],
                            Gaps.vGap8,
                            Row(
                              children: [
                                CommonAssetIcon(
                                  Assets.icons.rest,
                                  width: 16.r,
                                  height: 16.r,
                                  color: AppColors.black,
                                ),
                                Gaps.hGap10,
                                Text(
                                  exercise.restTimeBetweenSets.mmss,
                                  style: AppTextStyles.h5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Gaps.vGap16,
              AnimatedBuilder(
                animation: _rotationAnimation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotationAnimation.value * math.pi, // 180 degrees
                    child: CommonIconButton(
                      icon: Assets.icons.arrowDown,
                      onTap: _toggleExpand,
                      iconColor: AppColors.black,
                      iconSize: 20.r,
                      padding: EdgeInsets.zero,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  SvgGenImage _getSetIcon(WorkingSetType? setType) {
    return setType == WorkingSetType.distanceBased
        ? Assets.icons.distance
        : setType == WorkingSetType.timeBased
        ? Assets.icons.clock
        : Assets.icons.weight;
  }
}
