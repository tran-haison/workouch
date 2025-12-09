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
import '../cubit/workout_cubit.dart';
import '../cubit/workout_state.dart';

class AIWorkoutBuilderPage extends StatefulWidget {
  const AIWorkoutBuilderPage({super.key});

  @override
  State<AIWorkoutBuilderPage> createState() => _AIWorkoutBuilderPageState();
}

class _AIWorkoutBuilderPageState extends State<AIWorkoutBuilderPage> {
  Duration _workoutDuration = const Duration(minutes: 30);
  String _workoutIntensity = AppConstants.mediumIntensity;
  List<String> _workoutPrimaryGoals = [];
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
    context.read<WorkoutCubit>()
      ..getBodyParts()
      ..getEquipments();
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
                        Gaps.vGap24,
                        // Workout Duration
                        _PreferenceSection(
                          title: AppConstants.duration,
                          icon: Assets.icons.clock,
                          child: _DurationSelectorWidget(
                            initialDuration: _workoutDuration,
                            onChanged: (duration) {
                              _workoutDuration = duration;
                            },
                          ),
                        ),
                        Gaps.vGap20,
                        // Intensity
                        _PreferenceSection(
                          title: AppConstants.intensity,
                          icon: Assets.icons.fire,
                          child: _IntensitySelectorWidget(
                            initialIntensity: _workoutIntensity,
                            onChanged: (intensity) {
                              _workoutIntensity = intensity;
                            },
                          ),
                        ),
                        Gaps.vGap20,
                        // Primary Goal
                        _PreferenceSection(
                          title: AppConstants.primaryGoal,
                          icon: Assets.icons.rocket,
                          child: _PrimaryGoalSelectorWidget(
                            initialGoals: _workoutPrimaryGoals,
                            onChanged: (goals) {
                              _workoutPrimaryGoals = goals;
                            },
                          ),
                        ),
                        Gaps.vGap20,
                        // Target Body Parts
                        _PreferenceSection(
                          title: AppConstants.targetBodyParts,
                          icon: Assets.icons.dumbbell,
                          child: _BodyPartSelectorWidget(
                            initialBodyParts: _workoutBodyParts,
                            bodyParts: state.bodyParts,
                            onChanged: (bodyParts) {
                              _workoutBodyParts = bodyParts;
                            },
                          ),
                        ),
                        Gaps.vGap20,
                        // Available Equipment
                        _PreferenceSection(
                          title: AppConstants.availableEquipment,
                          icon: Assets.icons.weight,
                          child: _EquipmentSelectorWidget(
                            initialEquipments: _workoutEquipments,
                            equipments: state.equipments,
                            onChanged: (equipments) {
                              _workoutEquipments = equipments;
                            },
                          ),
                        ),
                        Gaps.vGap20,
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
                        Gaps.vGap40,
                        // Generate Button
                        CommonButton(
                          text: AppConstants.generateWorkout,
                          onPressed: _generateWorkout,
                        ),
                        Gaps.vGap40,
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

class _DurationSelectorWidget extends StatefulWidget {
  const _DurationSelectorWidget({
    required this.initialDuration,
    required this.onChanged,
  });

  final Duration initialDuration;
  final ValueChanged<Duration> onChanged;

  @override
  State<_DurationSelectorWidget> createState() =>
      _DurationSelectorWidgetState();
}

class _DurationSelectorWidgetState extends State<_DurationSelectorWidget> {
  late Duration _currentDuration;

  @override
  void initState() {
    super.initState();
    _currentDuration = widget.initialDuration;
  }

  @override
  Widget build(BuildContext context) {
    final minutes = _currentDuration.inMinutes;
    final durations = [
      const Duration(minutes: 10),
      const Duration(minutes: 20),
      const Duration(minutes: 30),
      const Duration(minutes: 45),
      const Duration(minutes: 60),
      const Duration(minutes: 90),
    ];
    final labels = [
      '10 ${AppConstants.mins}',
      '20 ${AppConstants.mins}',
      '30 ${AppConstants.mins}',
      '45 ${AppConstants.mins}',
      '60 ${AppConstants.mins}',
      '90+ ${AppConstants.mins}',
    ];

    return SizedBox(
      height: 44.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: durations.length,
        separatorBuilder: (_, _) => Gaps.hGap12,
        itemBuilder: (context, index) {
          final durationOption = durations[index];
          final label = labels[index];
          final isSelected = index == durations.length - 1
              ? minutes >= 90
              : minutes == durationOption.inMinutes;

          return _DurationButton(
            label: label,
            isSelected: isSelected,
            onTap: () {
              setState(() {
                _currentDuration = durationOption;
              });
              widget.onChanged(durationOption);
            },
          );
        },
      ),
    );
  }
}

class _DurationButton extends StatelessWidget {
  const _DurationButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.black : AppColors.grayBlue,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTextStyles.h4.copyWith(
              color: isSelected ? AppColors.white : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class _IntensitySelectorWidget extends StatefulWidget {
  const _IntensitySelectorWidget({
    required this.initialIntensity,
    required this.onChanged,
  });

  final String initialIntensity;
  final ValueChanged<String> onChanged;

  @override
  State<_IntensitySelectorWidget> createState() =>
      _IntensitySelectorWidgetState();
}

class _IntensitySelectorWidgetState extends State<_IntensitySelectorWidget> {
  late String _currentIntensity;

  @override
  void initState() {
    super.initState();
    _currentIntensity = widget.initialIntensity;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _IntensityButton(
            label: AppConstants.lowIntensity,
            isSelected: _currentIntensity == AppConstants.lowIntensity,
            onTap: () {
              setState(() {
                _currentIntensity = AppConstants.lowIntensity;
              });
              widget.onChanged(AppConstants.lowIntensity);
            },
          ),
        ),
        Gaps.hGap12,
        Expanded(
          child: _IntensityButton(
            label: AppConstants.mediumIntensity,
            isSelected: _currentIntensity == AppConstants.mediumIntensity,
            onTap: () {
              setState(() {
                _currentIntensity = AppConstants.mediumIntensity;
              });
              widget.onChanged(AppConstants.mediumIntensity);
            },
          ),
        ),
        Gaps.hGap12,
        Expanded(
          child: _IntensityButton(
            label: AppConstants.highIntensity,
            isSelected: _currentIntensity == AppConstants.highIntensity,
            onTap: () {
              setState(() {
                _currentIntensity = AppConstants.highIntensity;
              });
              widget.onChanged(AppConstants.highIntensity);
            },
          ),
        ),
      ],
    );
  }
}

class _IntensityButton extends StatelessWidget {
  const _IntensityButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.black : AppColors.grayBlue,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTextStyles.h4.copyWith(
              color: isSelected ? AppColors.white : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class _PrimaryGoalSelectorWidget extends StatefulWidget {
  const _PrimaryGoalSelectorWidget({
    required this.initialGoals,
    required this.onChanged,
  });

  final List<String> initialGoals;
  final ValueChanged<List<String>> onChanged;

  @override
  State<_PrimaryGoalSelectorWidget> createState() =>
      _PrimaryGoalSelectorWidgetState();
}

class _PrimaryGoalSelectorWidgetState
    extends State<_PrimaryGoalSelectorWidget> {
  late List<String> _currentGoals;

  @override
  void initState() {
    super.initState();
    _currentGoals = List.from(widget.initialGoals);
  }

  String _getDisplayText() {
    if (_currentGoals.isEmpty) {
      return AppConstants.selectPrimaryGoal;
    }
    return AppConstants.primaryGoal;
  }

  Future<void> _showDialog() async {
    final goals = [
      AppConstants.goalStrength,
      AppConstants.goalHypertrophy,
      AppConstants.goalEndurance,
      AppConstants.goalFatLoss,
      AppConstants.goalMobility,
    ];

    final selected = await showModalBottomSheet<List<String>>(
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
          child: _MultiSelectOptionListDialog(
            items: goals,
            title: AppConstants.selectPrimaryGoal,
            initialSelected: List.from(_currentGoals),
          ),
        );
      },
    );

    if (mounted && selected != null) {
      setState(() {
        _currentGoals = selected;
      });
      widget.onChanged(_currentGoals);
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(_getDisplayText(), style: AppTextStyles.h4),
                ),
                Gaps.hGap12,
                CommonAssetIcon(
                  Assets.icons.arrowDown,
                  width: 16.r,
                  height: 16.r,
                  color: AppColors.black,
                ),
              ],
            ),
            if (_currentGoals.isNotEmpty) ...[
              Gaps.vGap8,
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: _currentGoals.map((goal) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      goal,
                      style: AppTextStyles.h5.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _BodyPartSelectorWidget extends StatefulWidget {
  const _BodyPartSelectorWidget({
    required this.initialBodyParts,
    required this.bodyParts,
    required this.onChanged,
  });

  final List<String> initialBodyParts;
  final List<String> bodyParts;
  final ValueChanged<List<String>> onChanged;

  @override
  State<_BodyPartSelectorWidget> createState() =>
      _BodyPartSelectorWidgetState();
}

class _BodyPartSelectorWidgetState extends State<_BodyPartSelectorWidget> {
  late List<String> _currentBodyParts;

  @override
  void initState() {
    super.initState();
    _currentBodyParts = List.from(widget.initialBodyParts);
  }

  String _getDisplayText() {
    if (_currentBodyParts.isEmpty) {
      return AppConstants.selectBodyParts;
    }
    return AppConstants.targetBodyParts;
  }

  Future<void> _showDialog() async {
    if (widget.bodyParts.isEmpty) {
      showCommonToast(AppConstants.commonError, isError: true);
      return;
    }

    final selected = await showModalBottomSheet<List<String>>(
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
          child: _MultiSelectOptionListDialog(
            items: widget.bodyParts,
            title: AppConstants.selectBodyParts,
            initialSelected: List.from(_currentBodyParts),
          ),
        );
      },
    );

    if (mounted && selected != null) {
      setState(() {
        _currentBodyParts = selected;
      });
      widget.onChanged(_currentBodyParts);
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(_getDisplayText(), style: AppTextStyles.h4),
                ),
                Gaps.hGap12,
                CommonAssetIcon(
                  Assets.icons.arrowDown,
                  width: 16.r,
                  height: 16.r,
                  color: AppColors.black,
                ),
              ],
            ),
            if (_currentBodyParts.isNotEmpty) ...[
              Gaps.vGap8,
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: _currentBodyParts.map((bodyPart) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      bodyPart,
                      style: AppTextStyles.h5.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _EquipmentSelectorWidget extends StatefulWidget {
  const _EquipmentSelectorWidget({
    required this.initialEquipments,
    required this.equipments,
    required this.onChanged,
  });

  final List<String> initialEquipments;
  final List<String> equipments;
  final ValueChanged<List<String>> onChanged;

  @override
  State<_EquipmentSelectorWidget> createState() =>
      _EquipmentSelectorWidgetState();
}

class _EquipmentSelectorWidgetState extends State<_EquipmentSelectorWidget> {
  late List<String> _currentEquipments;

  @override
  void initState() {
    super.initState();
    _currentEquipments = List.from(widget.initialEquipments);
  }

  String _getDisplayText() {
    if (_currentEquipments.isEmpty) {
      return AppConstants.selectEquipment;
    }
    return AppConstants.availableEquipment;
  }

  Future<void> _showDialog() async {
    if (widget.equipments.isEmpty) {
      showCommonToast(AppConstants.commonError, isError: true);
      return;
    }

    final selected = await showModalBottomSheet<List<String>>(
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
          child: _MultiSelectOptionListDialog(
            items: widget.equipments,
            title: AppConstants.selectEquipment,
            initialSelected: List.from(_currentEquipments),
          ),
        );
      },
    );

    if (mounted && selected != null) {
      setState(() {
        _currentEquipments = selected;
      });
      widget.onChanged(_currentEquipments);
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(_getDisplayText(), style: AppTextStyles.h4),
                ),
                Gaps.hGap12,
                CommonAssetIcon(
                  Assets.icons.arrowDown,
                  width: 16.r,
                  height: 16.r,
                  color: AppColors.black,
                ),
              ],
            ),
            if (_currentEquipments.isNotEmpty) ...[
              Gaps.vGap8,
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: _currentEquipments.map((equipment) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      equipment,
                      style: AppTextStyles.h5.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ],
        ),
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

class _MultiSelectOptionListDialog extends StatefulWidget {
  const _MultiSelectOptionListDialog({
    required this.items,
    required this.title,
    required this.initialSelected,
  });

  final List<String> items;
  final String title;
  final List<String> initialSelected;

  @override
  State<_MultiSelectOptionListDialog> createState() =>
      _MultiSelectOptionListDialogState();
}

class _MultiSelectOptionListDialogState
    extends State<_MultiSelectOptionListDialog> {
  late List<String> _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = List.from(widget.initialSelected);
  }

  void _toggleItem(String item) {
    setState(() {
      if (_selectedItems.contains(item)) {
        _selectedItems.remove(item);
      } else {
        _selectedItems.add(item);
      }
    });
  }

  void _onDone() {
    context.pop(_selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text(widget.title, style: AppTextStyles.h3)),
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
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              final item = widget.items[index];
              final isSelected = _selectedItems.contains(item);
              return _buildItemTile(
                context,
                item: item,
                isSelected: isSelected,
                onTap: () => _toggleItem(item),
              );
            },
            separatorBuilder: (_, _) => Gaps.vGap12,
          ),
        ),
        Gaps.vGap16,
        CommonButton(text: AppConstants.done, onPressed: _onDone),
        Gaps.vGap8,
      ],
    );
  }

  Widget _buildItemTile(
    BuildContext context, {
    required String item,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
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
            Gaps.hGap12,
            Container(
              width: 24.r,
              height: 24.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.black : AppColors.grayBlue,
                  width: 2.r,
                ),
                color: isSelected ? AppColors.black : AppColors.transparent,
              ),
              child: isSelected
                  ? Icon(Icons.check, size: 16.r, color: AppColors.white)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
