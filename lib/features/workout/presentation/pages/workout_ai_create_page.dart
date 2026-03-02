import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../core/widgets/common_pop_up_dialog.dart';
import '../../../../core/widgets/common_switch.dart';
import '../../../../core/widgets/common_text_field.dart';
import '../../../../core/widgets/common_ai_generating_dialog.dart';
import '../../../../core/widgets/common_toast.dart';
import '../../../../gen/assets.gen.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../auth/presentation/cubit/auth_state.dart';
import '../../domain/enums/workout_gen_mode.dart';
import '../cubit/workout_state.dart';
import '../dialogs/workout_generation_limit_dialog.dart';
import '../../domain/entities/user_subscription.dart';
import '../../../../core/utils/date_utils.dart';
import '../../domain/enums/workout_goal.dart';
import '../../domain/enums/workout_intensity.dart';
import '../cubit/workout_cubit.dart';
import '../widgets/neat_body_parts_selector.dart';
import '../widgets/neat_duration_selector.dart';
import '../widgets/neat_equipments_selector.dart';
import '../widgets/neat_goals_selector.dart';
import '../widgets/neat_intensity_selector.dart';
import '../widgets/neat_location_selector.dart';

class WorkoutAiCreatePage extends StatefulWidget {
  const WorkoutAiCreatePage({super.key});

  @override
  State<WorkoutAiCreatePage> createState() => _WorkoutAiCreatePageState();
}

class _WorkoutAiCreatePageState extends State<WorkoutAiCreatePage> {
  // Common
  final List<Widget> _modesWidgets = [];
  bool _includeUserData = true;
  WorkoutGenMode _selectedMode = WorkoutGenMode.shuffle;

  // Shuffle Mode
  final _shuffleTextController = TextEditingController();

  // Neat Mode
  Duration _neatWorkoutDuration = const Duration(minutes: 30);
  WorkoutIntensity _neatWorkoutIntensity = WorkoutIntensity.medium;
  List<WorkoutGoal> _neatWorkoutGoals = [];
  List<String> _neatWorkoutBodyParts = [];
  List<String> _neatWorkoutEquipments = [];
  String _neatWorkoutLocation = AppConstants.anyLocation;
  final _neatNameController = TextEditingController();
  final _neatInjuriesController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _modesWidgets.addAll([
      _ShuffleModeTab(controller: _shuffleTextController),
      _NeatModeTab(
        nameController: _neatNameController,
        injuriesController: _neatInjuriesController,
        workoutDuration: _neatWorkoutDuration,
        workoutIntensity: _neatWorkoutIntensity,
        workoutGoals: _neatWorkoutGoals,
        workoutBodyParts: _neatWorkoutBodyParts,
        workoutEquipments: _neatWorkoutEquipments,
        workoutLocation: _neatWorkoutLocation,
        onDurationChanged: (duration) {
          setState(() {
            _neatWorkoutDuration = duration;
          });
        },
        onIntensityChanged: (intensity) {
          setState(() {
            _neatWorkoutIntensity = intensity;
          });
        },
        onGoalsChanged: (goals) {
          setState(() {
            _neatWorkoutGoals = goals;
          });
        },
        onBodyPartsChanged: (bodyParts) {
          setState(() {
            _neatWorkoutBodyParts = bodyParts;
          });
        },
        onEquipmentsChanged: (equipments) {
          setState(() {
            _neatWorkoutEquipments = equipments;
          });
        },
        onLocationChanged: (location) {
          setState(() {
            _neatWorkoutLocation = location;
          });
        },
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WorkoutCubit, WorkoutState>(
      listenWhen: (prev, curr) =>
          prev.generateAIWorkoutStatus != curr.generateAIWorkoutStatus,
      listener: (context, state) {
        if (state.generateAIWorkoutStatus == WorkoutStateStatus.loading) {
          context.showCommonAiGeneratingDialog();
        } else {
          context.hideCommonAiGeneratingDialog();
        }

        if (state.generateAIWorkoutStatus == WorkoutStateStatus.success) {
          final generatedWorkout = state.aiGeneratedWorkout;
          context.read<WorkoutCubit>().updateSelectedWorkout(
            name: generatedWorkout.name,
            exercises: generatedWorkout.exercises,
            restTime: generatedWorkout.restTimeBetweenExercises,
          );
          context.read<AuthCubit>().getUserSubscription(); // Sync from db
          context.pushNamed(AppRoute.workoutManualCreate.name);
          showCommonToast(AppConstants.workoutGenerated);
          return;
        }

        if (state.generateAIWorkoutStatus == WorkoutStateStatus.error &&
            state.generateAIWorkoutError != null) {
          showCommonToast(state.generateAIWorkoutError!.message, isError: true);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonIconButton(
                          backgroundColor: AppColors.grayBlue,
                          icon: Assets.icons.arrowBack,
                          iconColor: AppColors.black,
                          onTap: () => context.pop(),
                        ),
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            final userSub = state.userSubscription;
                            final hasLeft =
                                userSub?.hasWorkoutGenRemaining == true;

                            return GestureDetector(
                              onTap: () => _showUsageInfoDialog(userSub),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 8.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.grayBlue,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Center(
                                  child: Text(
                                    '${userSub?.workoutGenUsed} / ${userSub?.workoutGenLimit}',
                                    style: AppTextStyles.h5.copyWith(
                                      color: hasLeft
                                          ? AppColors.darkBlack
                                          : AppColors.mediumGray,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CommonAssetIcon(
                            Assets.icons.aiGenerator,
                            color: AppColors.darkBlack,
                          ),
                          Gaps.vGap10,
                          Text(
                            AppConstants.buildYourWorkout,
                            style: AppTextStyles.orbitron.copyWith(
                              fontSize: 24.sp,
                            ),
                          ),
                          Gaps.vGap10,
                          CommonButton(
                            text: _selectedMode.label,
                            onPressed: _switchMode,
                            isFullWidth: false,
                            textStyle: AppTextStyles.h4,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 6.h,
                            ),
                            radius: 12.r,
                            borderColor: AppColors.darkBlack,
                            backgroundColor: AppColors.transparent,
                            spaceWithTrailing: 6.w,
                            trailing: CommonAssetIcon(
                              Assets.icons.arrowDown,
                              width: 16.r,
                              height: 16.r,
                              color: AppColors.darkBlack,
                            ),
                          ),
                        ],
                      ),
                      Gaps.vGap20,
                      IndexedStack(
                        index: _selectedMode.isShuffle ? 0 : 1,
                        children: _modesWidgets,
                      ),
                    ],
                  ),
                ),
              ),
              Gaps.vGap10,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    CommonButton(
                      text: AppConstants.startBuilding,
                      onPressed: _generateWorkout,
                      backgroundColor: AppColors.darkBlack,
                      textStyle: AppTextStyles.h3.copyWith(
                        color: AppColors.white,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 18.h,
                      ),
                    ),
                    Gaps.vGap10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: _showIncludeDataInfoDialog,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                AppConstants.includeMyData,
                                style: AppTextStyles.h4,
                              ),
                              Gaps.hGap10,
                              CommonAssetIcon(
                                Assets.icons.info,
                                width: 20.r,
                                height: 20.r,
                                color: AppColors.black,
                              ),
                            ],
                          ),
                        ),
                        Gaps.hGap10,
                        CommonSwitch(
                          isOn: _includeUserData,
                          onChanged: (value) {
                            setState(() {
                              _includeUserData = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gaps.vGap20,
            ],
          ),
        ),
      ),
    );
  }

  void _switchMode() {
    setState(() {
      if (_selectedMode.isShuffle) {
        _selectedMode = WorkoutGenMode.neat;
      } else {
        _selectedMode = WorkoutGenMode.shuffle;
      }
    });
  }

  Future<void> _generateWorkout() async {
    final workoutCubit = context.read<WorkoutCubit>();
    final authCubit = context.read<AuthCubit>();
    final currentUser = _includeUserData ? authCubit.state.currentUser : null;
    final userSub = authCubit.state.userSubscription;

    // Basic user reach limit → show upgrade dialog to Pro plan
    if (authCubit.state.userBasicSubReachLimit) {
      await showUpgradePlanDialog(context);
      return;
    }

    // Pro user reach limit → show limit exceeded dialog
    if (authCubit.state.userProSubReachLimit && userSub != null) {
      await showProLimitDialog(context, currPeriodEnd: userSub.periodEnd);
      return;
    }

    if (_selectedMode.isShuffle) {
      // Shuffle Mode - Simple text input
      final preferences = _shuffleTextController.text.trim();
      if (preferences.isEmpty) {
        showCommonToast(AppConstants.pleaseEnterWorkoutPref, isError: true);
        return;
      }

      await workoutCubit.generateShuffleModeWorkout(
        userPreferences: preferences,
        user: currentUser,
        userSub: userSub,
      );
    } else {
      // Neat Mode - Structured preferences
      await workoutCubit.generateNeatModeWorkout(
        duration: _neatWorkoutDuration,
        intensity: _neatWorkoutIntensity,
        goals: _neatWorkoutGoals,
        bodyParts: _neatWorkoutBodyParts,
        equipments: _neatWorkoutEquipments,
        location: _neatWorkoutLocation,
        workoutName: _neatNameController.text.trim().isEmpty
            ? null
            : _neatNameController.text.trim(),
        injuries: _neatInjuriesController.text.trim().isEmpty
            ? null
            : _neatInjuriesController.text.trim(),
        user: currentUser,
        userSub: userSub,
      );
    }
  }

  void _showIncludeDataInfoDialog() {
    showCommonPopUpDialog(
      context,
      title: AppConstants.includeMyData,
      message: AppConstants.includeMyDataInfo,
      showSecondButton: false,
      firstButtonText: AppConstants.iUnderstood,
    );
  }

  void _showUsageInfoDialog(UserSubscription? userSub) {
    if (userSub == null) return;

    final periodEndText = AppDateUtils.fullDate(userSub.periodEnd);
    final remaining = userSub.remainingWorkoutGen <= 0
        ? 0
        : userSub.remainingWorkoutGen;

    final message =
        'You can generate AI workouts up to ${userSub.workoutGenLimit} times each period.\n\n'
        'You have $remaining remaining generation(s) in this period, which will be renewed on $periodEndText';

    showCommonPopUpDialog(
      context,
      title: AppConstants.aiWorkoutUsage,
      message: message,
      showSecondButton: false,
      firstButtonText: AppConstants.close,
    );
  }
}

class _ShuffleModeTab extends StatefulWidget {
  const _ShuffleModeTab({required this.controller});

  final TextEditingController controller;

  @override
  State<_ShuffleModeTab> createState() => _ShuffleModeTabState();
}

class _ShuffleModeTabState extends State<_ShuffleModeTab>
    with AutomaticKeepAliveClientMixin {
  var _textLength = 0;
  final _maxTextLength = 500;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppConstants.shuffleModeDescription, style: AppTextStyles.h4),
          Gaps.vGap16,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              gradient: AppColors.backgroundGradient,
              boxShadow: [
                BoxShadow(
                  color: AppColors.secondary,
                  blurRadius: 8,
                  offset: const Offset(2, 2),
                ),
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.8),
                  blurRadius: 8,
                  offset: const Offset(-2, -2),
                ),
              ],
            ),
            padding: EdgeInsets.all(2.r),
            child: SizedBox(
              height: 180.h,
              child: CommonTextField(
                controller: widget.controller,
                hintText: AppConstants.workoutPreferencesHint,
                onChanged: (value) {
                  setState(() {
                    _textLength = value.length;
                  });
                },
                isShowBorder: false,
                backgroundColor: AppColors.white,
                expands: true,
                minLines: null,
                maxLines: null,
                maxLength: _maxTextLength,
                textAlignVertical: TextAlignVertical.top,
                radius: 10.r,
                inputTextStyle: AppTextStyles.h4.copyWith(
                  color: AppColors.text,
                  fontWeight: FontWeight.w300,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 14.h,
                ),
              ),
            ),
          ),
          Gaps.vGap10,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '$_textLength / $_maxTextLength',
                style: AppTextStyles.h5.copyWith(color: AppColors.mediumGray),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NeatModeTab extends StatefulWidget {
  const _NeatModeTab({
    required this.nameController,
    required this.injuriesController,
    required this.workoutDuration,
    required this.workoutIntensity,
    required this.workoutGoals,
    required this.workoutBodyParts,
    required this.workoutEquipments,
    required this.workoutLocation,
    required this.onDurationChanged,
    required this.onIntensityChanged,
    required this.onGoalsChanged,
    required this.onBodyPartsChanged,
    required this.onEquipmentsChanged,
    required this.onLocationChanged,
  });

  final TextEditingController nameController;
  final TextEditingController injuriesController;
  final Duration workoutDuration;
  final WorkoutIntensity workoutIntensity;
  final List<WorkoutGoal> workoutGoals;
  final List<String> workoutBodyParts;
  final List<String> workoutEquipments;
  final String workoutLocation;
  final ValueChanged<Duration> onDurationChanged;
  final ValueChanged<WorkoutIntensity> onIntensityChanged;
  final ValueChanged<List<WorkoutGoal>> onGoalsChanged;
  final ValueChanged<List<String>> onBodyPartsChanged;
  final ValueChanged<List<String>> onEquipmentsChanged;
  final ValueChanged<String> onLocationChanged;

  @override
  State<_NeatModeTab> createState() => _NeatModeTabState();
}

class _NeatModeTabState extends State<_NeatModeTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    return BlocBuilder<WorkoutCubit, WorkoutState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Workout Name
              Text(
                AppConstants.name,
                style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
              ),
              Gaps.vGap8,
              CommonTextField(
                controller: widget.nameController,
                hintText: AppConstants.nameHint,
                onChanged: (_) {},
                isShowBorder: true,
                borderColor: AppColors.grayBlue,
                borderFocusColor: AppColors.darkBlack,
                inputTextStyle: AppTextStyles.h4.copyWith(
                  color: AppColors.text,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Gaps.vGap24,
              // Workout Duration
              _PreferenceSection(
                title: AppConstants.duration,
                icon: Assets.icons.clock,
                child: NeatDurationSelector(
                  initialDuration: widget.workoutDuration,
                  onChanged: widget.onDurationChanged,
                ),
              ),
              Gaps.vGap24,
              // Intensity
              _PreferenceSection(
                title: AppConstants.intensity,
                icon: Assets.icons.fire,
                child: NeatIntensitySelector(
                  initialIntensity: widget.workoutIntensity,
                  onChanged: widget.onIntensityChanged,
                ),
              ),
              Gaps.vGap24,
              // Workout Goals
              _PreferenceSection(
                title: AppConstants.workoutGoals,
                icon: Assets.icons.goal,
                child: NeatGoalsSelector(
                  initialGoals: widget.workoutGoals,
                  onChanged: widget.onGoalsChanged,
                ),
              ),
              Gaps.vGap24,
              // Target Body Parts
              _PreferenceSection(
                title: AppConstants.targetBodyParts,
                icon: Assets.icons.muscle,
                child: NeatBodyPartsSelector(
                  initialBodyParts: widget.workoutBodyParts,
                  bodyParts: state.bodyParts,
                  onChanged: widget.onBodyPartsChanged,
                ),
              ),
              Gaps.vGap24,
              // Available Equipment
              _PreferenceSection(
                title: AppConstants.availableEquipments,
                icon: Assets.icons.dumbbellOutline,
                child: NeatEquipmentsSelector(
                  initialEquipments: widget.workoutEquipments,
                  equipments: state.equipments,
                  onChanged: widget.onEquipmentsChanged,
                ),
              ),
              Gaps.vGap24,
              // Location
              _PreferenceSection(
                title: AppConstants.location,
                icon: Assets.icons.distance,
                child: NeatLocationSelector(
                  initialLocation: widget.workoutLocation,
                  onChanged: widget.onLocationChanged,
                ),
              ),
              Gaps.vGap24,
              // Injuries/Limitations
              _PreferenceSection(
                title: AppConstants.injuriesLimitations,
                icon: Assets.icons.sick,
                child: CommonTextField(
                  controller: widget.injuriesController,
                  hintText: AppConstants.injuriesLimitationsHint,
                  onChanged: (_) {},
                  isShowBorder: true,
                  borderColor: AppColors.grayBlue,
                  borderFocusColor: AppColors.darkBlack,
                  maxLines: 3,
                  inputTextStyle: AppTextStyles.h4.copyWith(
                    color: AppColors.text,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
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
    return Column(
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
    );
  }
}
