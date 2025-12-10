import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../core/widgets/common_text_field.dart';
import '../../../../core/widgets/common_toast.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/enums/workout_goal.dart';
import '../../domain/enums/workout_intensity.dart';
import '../cubit/workout_cubit.dart';
import '../cubit/workout_state.dart';
import '../widgets/lazy_body_parts_selector.dart';
import '../widgets/lazy_duration_selector.dart';
import '../widgets/lazy_equipments_selector.dart';
import '../widgets/lazy_goals_selector.dart';
import '../widgets/lazy_intensity_selector.dart';
import '../widgets/lazy_location_selector.dart';

class WorkoutLazyBuilderPage extends StatefulWidget {
  const WorkoutLazyBuilderPage({super.key});

  @override
  State<WorkoutLazyBuilderPage> createState() => _WorkoutLazyBuilderPageState();
}

class _WorkoutLazyBuilderPageState extends State<WorkoutLazyBuilderPage> {
  Duration _workoutDuration = const Duration(minutes: 30);
  WorkoutIntensity _workoutIntensity = WorkoutIntensity.medium;
  List<WorkoutGoal> _workoutGoals = [];
  List<String> _workoutBodyParts = [];
  List<String> _workoutEquipments = [];
  String _workoutLocation = AppConstants.anyLocation;

  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    context.read<WorkoutCubit>().getBodyParts();
    context.read<WorkoutCubit>().getEquipments();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutCubit, WorkoutState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: Row(
                    children: [
                      CommonIconButton(
                        backgroundColor: AppColors.grayBlue,
                        icon: Assets.icons.arrowBack,
                        iconColor: AppColors.black,
                        onTap: () => context.pop(),
                      ),
                      const Spacer(),
                      Text(
                        AppConstants.aiWorkoutBuilder,
                        style: AppTextStyles.h3,
                      ),
                      const Spacer(),
                      SizedBox(width: 48.w),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Workout Name
                        Text(
                          AppConstants.name,
                          style: AppTextStyles.h4.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Gaps.vGap8,
                        CommonTextField(
                          controller: _nameController,
                          hintText: AppConstants.nameHint,
                          onChanged: (_) {},
                          isShowBorder: true,
                          borderColor: AppColors.grayBlue,
                          borderFocusColor: AppColors.black,
                        ),
                        Gaps.vGap16,
                        // Workout Duration
                        _PreferenceSection(
                          title: AppConstants.duration,
                          icon: Assets.icons.clock,
                          child: LazyDurationSelector(
                            initialDuration: _workoutDuration,
                            onChanged: (duration) {
                              _workoutDuration = duration;
                            },
                          ),
                        ),
                        Gaps.vGap16,
                        // Intensity
                        _PreferenceSection(
                          title: AppConstants.intensity,
                          icon: Assets.icons.fire,
                          child: LazyIntensitySelector(
                            initialIntensity: _workoutIntensity,
                            onChanged: (intensity) {
                              _workoutIntensity = intensity;
                            },
                          ),
                        ),
                        Gaps.vGap16,
                        // Workout Goals
                        _PreferenceSection(
                          title: AppConstants.workoutGoals,
                          icon: Assets.icons.rocket,
                          child: LazyGoalsSelector(
                            initialGoals: _workoutGoals,
                            onChanged: (goals) {
                              _workoutGoals = goals;
                            },
                          ),
                        ),
                        Gaps.vGap16,
                        // Target Body Parts
                        _PreferenceSection(
                          title: AppConstants.targetBodyParts,
                          icon: Assets.icons.dumbbell,
                          child: LazyBodyPartsSelector(
                            initialBodyParts: _workoutBodyParts,
                            bodyParts: state.bodyParts,
                            onChanged: (bodyParts) {
                              _workoutBodyParts = bodyParts;
                            },
                          ),
                        ),
                        Gaps.vGap16,
                        // Available Equipment
                        _PreferenceSection(
                          title: AppConstants.availableEquipments,
                          icon: Assets.icons.weight,
                          child: LazyEquipmentsSelector(
                            initialEquipments: _workoutEquipments,
                            equipments: state.equipments,
                            onChanged: (equipments) {
                              _workoutEquipments = equipments;
                            },
                          ),
                        ),
                        Gaps.vGap16,
                        // Location
                        _PreferenceSection(
                          title: AppConstants.location,
                          icon: Assets.icons.distance,
                          child: LazyLocationSelector(
                            initialLocation: _workoutLocation,
                            onChanged: (location) {
                              _workoutLocation = location;
                            },
                          ),
                        ),
                        Gaps.vGap20,
                        // Generate Button
                        CommonButton(
                          text: AppConstants.generateWorkout,
                          onPressed: _generateWorkout,
                        ),
                        Gaps.vGap20,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _generateWorkout() async {
    // TODO: Implement AI workout generation
    // For now, show a placeholder message
    showCommonToast('AI workout generation coming soon!', isError: false);
  }
}

class _PreferenceSection extends StatelessWidget {
  const _PreferenceSection({
    required this.title,
    required this.icon,
    required this.child,
  });

  final String title;
  final SvgGenImage icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.grayBlue, width: 1.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.grayBlue,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CommonAssetIcon(
                icon,
                width: 20.r,
                height: 20.r,
                color: AppColors.black,
              ),
              Gaps.hGap10,
              Text(
                title,
                style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Gaps.vGap12,
          child,
        ],
      ),
    );
  }
}
