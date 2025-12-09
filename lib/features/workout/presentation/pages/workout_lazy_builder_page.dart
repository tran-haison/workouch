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
import '../../../../core/widgets/common_bottom_dialog.dart';
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
                          child: LazyEquipmentSelector(
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
                          child: _LocationSelectorWidget(
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

class _LocationSelectorWidget extends StatefulWidget {
  const _LocationSelectorWidget({
    required this.initialLocation,
    required this.onChanged,
  });

  final String initialLocation;
  final ValueChanged<String> onChanged;

  @override
  State<_LocationSelectorWidget> createState() =>
      _LocationSelectorWidgetState();
}

class _LocationSelectorWidgetState extends State<_LocationSelectorWidget> {
  late String _currentLocation;

  @override
  void initState() {
    super.initState();
    _currentLocation = widget.initialLocation;
  }

  Future<void> _showDialog() async {
    final locations = [
      AppConstants.locationLivingRoom,
      AppConstants.locationGarageBackyard,
      AppConstants.locationCommercialGym,
      AppConstants.locationHotelRoom,
      AppConstants.locationOutdoorsPark,
    ];

    final selected = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      useSafeArea: true,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      builder: (context) {
        return CommonBottomDialog(
          child: _OptionListDialog(
            items: locations,
            title: AppConstants.selectLocation,
            any: AppConstants.anyLocation,
            initialValue: _currentLocation,
          ),
        );
      },
    );

    if (mounted && selected != null) {
      setState(() {
        _currentLocation = selected == AppConstants.anyLocation
            ? AppConstants.anyLocation
            : selected;
      });
      widget.onChanged(_currentLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showDialog,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.grayBlue,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Expanded(child: Text(_currentLocation, style: AppTextStyles.h4)),
            Gaps.hGap12,
            CommonAssetIcon(
              Assets.icons.arrowDown,
              width: 16.r,
              height: 16.r,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionListDialog extends StatelessWidget {
  const _OptionListDialog({
    required this.items,
    required this.title,
    required this.any,
    required this.initialValue,
  });

  final List<String> items;
  final String title;
  final String any;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text(title, style: AppTextStyles.h3)),
            Gaps.hGap10,
            CommonIconButton(
              icon: Assets.icons.close,
              iconSize: 20.r,
              padding: EdgeInsets.all(8.r),
              iconColor: AppColors.black,
              backgroundColor: AppColors.grayBlue,
              onTap: () => context.pop(),
            ),
          ],
        ),
        Gaps.vGap16,
        Flexible(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: items.length + 1, // +1 for "any item"
            itemBuilder: (context, index) {
              if (index == 0) {
                // "Any" item
                return _buildItemTile(
                  context,
                  item: any,
                  isSelected: initialValue == any,
                );
              } else {
                // Other items
                return _buildItemTile(
                  context,
                  item: items[index - 1],
                  isSelected: initialValue == items[index - 1],
                );
              }
            },
            separatorBuilder: (_, _) => Gaps.vGap12,
          ),
        ),
      ],
    );
  }

  Widget _buildItemTile(
    BuildContext context, {
    required String item,
    bool isSelected = false,
  }) {
    return InkWell(
      onTap: () => context.pop(item),
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondary : AppColors.transparent,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.black : AppColors.grayBlue,
            width: 1.r,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                item,
                style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            if (isSelected)
              CommonAssetIcon(
                Assets.icons.check,
                width: 20.r,
                height: 20.r,
                color: AppColors.black,
              ),
          ],
        ),
      ),
    );
  }
}
