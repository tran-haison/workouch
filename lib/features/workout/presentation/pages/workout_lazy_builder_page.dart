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
import '../../../../core/widgets/common_text_field.dart';
import '../../../../core/widgets/common_ai_generating_dialog.dart';
import '../../../../core/widgets/common_toast.dart';
import '../../../../gen/assets.gen.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../cubit/workout_state.dart';
import '../dialogs/workout_generation_limit_dialog.dart';
import '../../domain/entities/user_subscription.dart';
import '../../domain/enums/workout_goal.dart';
import '../../domain/enums/workout_intensity.dart';
import '../cubit/workout_cubit.dart';
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

class _WorkoutLazyBuilderPageState extends State<WorkoutLazyBuilderPage>
    with SingleTickerProviderStateMixin {
  Duration _workoutDuration = const Duration(minutes: 30);
  WorkoutIntensity _workoutIntensity = WorkoutIntensity.medium;
  List<WorkoutGoal> _workoutGoals = [];
  List<String> _workoutBodyParts = [];
  List<String> _workoutEquipments = [];
  String _workoutLocation = AppConstants.anyLocation;

  final _nameController = TextEditingController();
  final _injuriesController = TextEditingController();
  final _simplePreferencesController = TextEditingController();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WorkoutCubit, WorkoutState>(
      listenWhen: (prev, curr) =>
          prev.generateAIWorkoutStatus != curr.generateAIWorkoutStatus ||
          prev.workoutGenLimitStatus != curr.workoutGenLimitStatus,
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
          context.pushNamed(AppRoute.workoutCreation.name);
          showCommonToast(AppConstants.workoutGenerated);
          return;
        }

        if (state.generateAIWorkoutStatus == WorkoutStateStatus.error) {
          // Basic user → show upgrade dialog to Pro plan
          if (state.workoutGenLimitStatus.isNeedUpgradePlan) {
            showUpgradePlanDialog(context);
            context.read<WorkoutCubit>().resetWorkoutGenLimitStatus();
            return;
          }

          // Pro user → show limit reached dialog
          if (state.workoutGenLimitStatus.isReachedProLimit &&
              state.userSubscription != null) {
            showProLimitDialog(
              context,
              currPeriodEnd: state.userSubscription!.periodEnd,
            );
            context.read<WorkoutCubit>().resetWorkoutGenLimitStatus();
            return;
          }

          // Only show error toast if it's not the workout generation limit dialog case
          showCommonToast(
            state.generateAIWorkoutError?.message ??
                AppConstants.workoutGenerationError,
            isError: true,
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CommonIconButton(
                          backgroundColor: AppColors.grayBlue,
                          icon: Assets.icons.arrowBack,
                          iconColor: AppColors.black,
                          onTap: () => context.pop(),
                        ),
                        Gaps.hGap12,
                        Expanded(
                          child: Text(
                            AppConstants.lazy,
                            style: AppTextStyles.orbitron.copyWith(
                              fontSize: 20.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Gaps.hGap12,
                        BlocBuilder<WorkoutCubit, WorkoutState>(
                          builder: (context, state) {
                            final userSub = state.userSubscription;
                            final hasLeft =
                                userSub?.hasWorkoutGenRemaining == true;

                            return Container(
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
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Tab Bar
              TabBar(
                controller: _tabController,
                labelColor: AppColors.black,
                unselectedLabelColor: AppColors.mediumGray,
                indicatorColor: AppColors.black,
                indicatorWeight: 2,
                labelStyle: AppTextStyles.h4.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: AppTextStyles.h4,
                dividerColor: AppColors.transparent,
                overlayColor: WidgetStateProperty.all(AppColors.transparent),
                tabs: [
                  Tab(text: AppConstants.theShuffleMode),
                  Tab(text: AppConstants.theNeatMode),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Shuffle Mode Tab
                    _ShuffleModeTab(
                      controller: _simplePreferencesController,
                      onGenerate: _generateWorkout,
                    ),
                    // Neat Mode Tab
                    _NeatModeTab(
                      nameController: _nameController,
                      injuriesController: _injuriesController,
                      workoutDuration: _workoutDuration,
                      workoutIntensity: _workoutIntensity,
                      workoutGoals: _workoutGoals,
                      workoutBodyParts: _workoutBodyParts,
                      workoutEquipments: _workoutEquipments,
                      workoutLocation: _workoutLocation,
                      onDurationChanged: (duration) {
                        setState(() {
                          _workoutDuration = duration;
                        });
                      },
                      onIntensityChanged: (intensity) {
                        setState(() {
                          _workoutIntensity = intensity;
                        });
                      },
                      onGoalsChanged: (goals) {
                        setState(() {
                          _workoutGoals = goals;
                        });
                      },
                      onBodyPartsChanged: (bodyParts) {
                        setState(() {
                          _workoutBodyParts = bodyParts;
                        });
                      },
                      onEquipmentsChanged: (equipments) {
                        setState(() {
                          _workoutEquipments = equipments;
                        });
                      },
                      onLocationChanged: (location) {
                        setState(() {
                          _workoutLocation = location;
                        });
                      },
                      onGenerate: _generateWorkout,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _generateWorkout() async {
    final workoutCubit = context.read<WorkoutCubit>();
    final authCubit = context.read<AuthCubit>();
    final currentUser = authCubit.state.currentUser;
    final currentTab = _tabController.index;

    if (currentTab == 0) {
      // Shuffle Mode - Simple text input
      final preferences = _simplePreferencesController.text.trim();
      if (preferences.isEmpty) {
        showCommonToast(AppConstants.pleaseEnterWorkoutPref, isError: true);
        return;
      }

      await workoutCubit.generateShuffleModeWorkout(
        userPreferences: preferences,
        user: currentUser,
      );
    } else {
      // Neat Mode - Structured preferences
      await workoutCubit.generateNeatModeWorkout(
        duration: _workoutDuration,
        intensity: _workoutIntensity,
        goals: _workoutGoals,
        bodyParts: _workoutBodyParts,
        equipments: _workoutEquipments,
        location: _workoutLocation,
        workoutName: _nameController.text.trim().isEmpty
            ? null
            : _nameController.text.trim(),
        injuries: _injuriesController.text.trim().isEmpty
            ? null
            : _injuriesController.text.trim(),
        user: currentUser,
      );
    }
  }
}

class _ShuffleModeTab extends StatefulWidget {
  const _ShuffleModeTab({required this.controller, required this.onGenerate});

  final TextEditingController controller;
  final VoidCallback onGenerate;

  @override
  State<_ShuffleModeTab> createState() => _ShuffleModeTabState();
}

class _ShuffleModeTabState extends State<_ShuffleModeTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConstants.letAiPlanWorkoutForYou,
            style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
          ),
          Gaps.vGap8,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              gradient: AppColors.backgroundGradient,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: EdgeInsets.all(1.5.r),
            child: CommonTextField(
              controller: widget.controller,
              hintText: AppConstants.workoutPreferencesHint,
              onChanged: (_) {},
              isShowBorder: false,
              backgroundColor: AppColors.white,
              maxLines: 6,
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
          Gaps.vGap30,
          CommonButton(
            text: AppConstants.buildMyWorkout,
            onPressed: widget.onGenerate,
            backgroundGradientColor: AppColors.backgroundGradient,
            textStyle: AppTextStyles.h3,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
            trailing: CommonAssetIcon(
              Assets.icons.aiGenerator,
              width: 20.r,
              height: 20.r,
              color: AppColors.black,
            ),
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
    required this.onGenerate,
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
  final VoidCallback onGenerate;

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
        return SingleChildScrollView(
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
                borderFocusColor: AppColors.black,
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
                child: LazyDurationSelector(
                  initialDuration: widget.workoutDuration,
                  onChanged: widget.onDurationChanged,
                ),
              ),
              Gaps.vGap24,
              // Intensity
              _PreferenceSection(
                title: AppConstants.intensity,
                icon: Assets.icons.fire,
                child: LazyIntensitySelector(
                  initialIntensity: widget.workoutIntensity,
                  onChanged: widget.onIntensityChanged,
                ),
              ),
              Gaps.vGap24,
              // Workout Goals
              _PreferenceSection(
                title: AppConstants.workoutGoals,
                icon: Assets.icons.goal,
                child: LazyGoalsSelector(
                  initialGoals: widget.workoutGoals,
                  onChanged: widget.onGoalsChanged,
                ),
              ),
              Gaps.vGap24,
              // Target Body Parts
              _PreferenceSection(
                title: AppConstants.targetBodyParts,
                icon: Assets.icons.muscle,
                child: LazyBodyPartsSelector(
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
                child: LazyEquipmentsSelector(
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
                child: LazyLocationSelector(
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
                  isShowBorder: false,
                  backgroundColor: AppColors.grayBlue,
                  maxLines: 3,
                  radius: 12.r,
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
              Gaps.vGap30,
              // Generate Button
              CommonButton(
                text: AppConstants.buildMyWorkout,
                onPressed: widget.onGenerate,
                backgroundGradientColor: AppColors.backgroundGradient,
                textStyle: AppTextStyles.h3,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                trailing: CommonAssetIcon(
                  Assets.icons.aiGenerator,
                  width: 20.r,
                  height: 20.r,
                  color: AppColors.black,
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
