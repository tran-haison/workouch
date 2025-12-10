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
    _loadData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
                  tabs: [
                    Tab(text: AppConstants.simpleMode),
                    Tab(text: AppConstants.advancedMode),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // Simple Mode Tab
                      _SimpleModeTab(
                        controller: _simplePreferencesController,
                        onGenerate: _generateWorkout,
                      ),
                      // Advanced Mode Tab
                      _AdvancedModeTab(
                        state: state,
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

class _SimpleModeTab extends StatefulWidget {
  const _SimpleModeTab({required this.controller, required this.onGenerate});

  final TextEditingController controller;
  final VoidCallback onGenerate;

  @override
  State<_SimpleModeTab> createState() => _SimpleModeTabState();
}

class _SimpleModeTabState extends State<_SimpleModeTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConstants.workoutPreferences,
            style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
          ),
          Gaps.vGap8,
          CommonTextField(
            controller: widget.controller,
            hintText: AppConstants.workoutPreferencesHint,
            onChanged: (_) {},
            isShowBorder: false,
            backgroundColor: AppColors.grayBlue,
            maxLines: 6,
            radius: 12.r,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
          ),
          Gaps.vGap32,
          CommonButton(
            text: AppConstants.generateWorkout,
            onPressed: widget.onGenerate,
          ),
        ],
      ),
    );
  }
}

class _AdvancedModeTab extends StatefulWidget {
  const _AdvancedModeTab({
    required this.state,
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

  final WorkoutState state;
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
  State<_AdvancedModeTab> createState() => _AdvancedModeTabState();
}

class _AdvancedModeTabState extends State<_AdvancedModeTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
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
          ),
          Gaps.vGap16,
          // Workout Duration
          _PreferenceSection(
            title: AppConstants.duration,
            icon: Assets.icons.clock,
            child: LazyDurationSelector(
              initialDuration: widget.workoutDuration,
              onChanged: widget.onDurationChanged,
            ),
          ),
          Gaps.vGap16,
          // Intensity
          _PreferenceSection(
            title: AppConstants.intensity,
            icon: Assets.icons.fire,
            child: LazyIntensitySelector(
              initialIntensity: widget.workoutIntensity,
              onChanged: widget.onIntensityChanged,
            ),
          ),
          Gaps.vGap16,
          // Workout Goals
          _PreferenceSection(
            title: AppConstants.workoutGoals,
            icon: Assets.icons.rocket,
            child: LazyGoalsSelector(
              initialGoals: widget.workoutGoals,
              onChanged: widget.onGoalsChanged,
            ),
          ),
          Gaps.vGap16,
          // Target Body Parts
          _PreferenceSection(
            title: AppConstants.targetBodyParts,
            icon: Assets.icons.dumbbell,
            child: LazyBodyPartsSelector(
              initialBodyParts: widget.workoutBodyParts,
              bodyParts: widget.state.bodyParts,
              onChanged: widget.onBodyPartsChanged,
            ),
          ),
          Gaps.vGap16,
          // Available Equipment
          _PreferenceSection(
            title: AppConstants.availableEquipments,
            icon: Assets.icons.weight,
            child: LazyEquipmentsSelector(
              initialEquipments: widget.workoutEquipments,
              equipments: widget.state.equipments,
              onChanged: widget.onEquipmentsChanged,
            ),
          ),
          Gaps.vGap16,
          // Location
          _PreferenceSection(
            title: AppConstants.location,
            icon: Assets.icons.distance,
            child: LazyLocationSelector(
              initialLocation: widget.workoutLocation,
              onChanged: widget.onLocationChanged,
            ),
          ),
          Gaps.vGap16,
          // Injuries/Limitations
          _PreferenceSection(
            title: AppConstants.injuriesLimitations,
            icon: Assets.icons.info,
            child: CommonTextField(
              controller: widget.injuriesController,
              hintText: AppConstants.injuriesLimitationsHint,
              onChanged: (_) {},
              isShowBorder: false,
              backgroundColor: AppColors.grayBlue,
              maxLines: 3,
              radius: 12.r,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 14.h,
              ),
            ),
          ),
          Gaps.vGap20,
          // Generate Button
          CommonButton(
            text: AppConstants.generateWorkout,
            onPressed: widget.onGenerate,
          ),
          Gaps.vGap20,
        ],
      ),
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
