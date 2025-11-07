import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_text_field.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/working_set.dart';

class WorkingSetInput extends StatefulWidget {
  const WorkingSetInput({
    required this.onEdit,
    required this.onDelete,
    required this.type,
    this.showDeleteButton = true,
    this.initialWorkingSet,
    super.key,
  });

  final Function(WorkingSet workingSet) onEdit;
  final VoidCallback onDelete;
  final WorkingSetType type;
  final bool showDeleteButton;
  final WorkingSet? initialWorkingSet;

  @override
  State<WorkingSetInput> createState() => _WorkingSetInputState();
}

class _WorkingSetInputState extends State<WorkingSetInput> {
  late WorkingSet _workingSet;

  @override
  void initState() {
    super.initState();
    // Initialize with provided set if it matches setType, otherwise create empty one
    if (widget.initialWorkingSet != null) {
      final initialType = widget.initialWorkingSet!.when(
        weightBased: (_, _, _) => WorkingSetType.weightBased,
        timeBased: (_) => WorkingSetType.timeBased,
        distanceBased: (_) => WorkingSetType.distanceBased,
        repsOnly: (_, _) => WorkingSetType.repsOnly,
      );
      // Only use initial set if types match
      if (initialType == widget.type) {
        _workingSet = widget.initialWorkingSet!;
      } else {
        _workingSet = _createEmptySet(widget.type);
      }
    } else {
      _workingSet = _createEmptySet(widget.type);
    }
  }

  WorkingSet _createEmptySet(WorkingSetType type) {
    switch (type) {
      case WorkingSetType.weightBased:
        return const WorkingSet.weightBased();
      case WorkingSetType.timeBased:
        return const WorkingSet.timeBased();
      case WorkingSetType.distanceBased:
        return const WorkingSet.distanceBased();
      case WorkingSetType.repsOnly:
        return const WorkingSet.repsOnly();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // First input field (always present)
        _InputField(
          initialValue: _firstInputInitialValue,
          label: _firstInputLabel,
          onChanged: _onFirstInputChanged,
          maxLength: _firstInputMaxLength,
          allowDecimal: false,
        ),
        Gaps.hGap10,
        // Second input field (always present)
        _InputField(
          initialValue: _secondInputInitialValue,
          label: _secondInputLabel,
          onChanged: _onSecondInputChanged,
          maxLength: _secondInputMaxLength,
          allowDecimal: false,
        ),
        // Third input field (only for weightBased)
        if (_hasThirdInput) ...[
          Gaps.hGap10,
          _InputField(
            initialValue: _thirdInputInitialValue,
            label: _thirdInputLabel,
            onChanged: _onThirdInputChanged,
            maxLength: _thirdInputMaxLength,
            allowDecimal: true, // Weight allows decimal
          ),
        ],
        if (widget.showDeleteButton) ...[
          Gaps.hGap16,
          CommonIconButton(
            icon: Assets.icons.delete,
            iconSize: 16.r,
            padding: EdgeInsets.all(8.r),
            backgroundColor: AppColors.error,
            radius: 12.r,
            onTap: widget.onDelete,
          ),
        ],
      ],
    );
  }

  bool get _hasThirdInput {
    return widget.type == WorkingSetType.weightBased;
  }

  String? get _firstInputInitialValue {
    return _workingSet.when(
      weightBased: (sets, reps, weight) => sets != 0 ? sets.toString() : null,
      timeBased: (duration) => duration.inSeconds != 0
          ? (duration.inSeconds ~/ 60).toString()
          : null, // Show minutes
      distanceBased: (distance) => distance != 0
          ? (distance ~/ 1000).toString()
          : null, // Show km (integer)
      repsOnly: (sets, reps) => sets != 0 ? sets.toString() : null,
    );
  }

  String? get _secondInputInitialValue {
    return _workingSet.when(
      weightBased: (sets, reps, weight) => reps != 0 ? reps.toString() : null,
      timeBased: (duration) {
        final seconds = duration.inSeconds % 60;
        return seconds != 0 ? seconds.toString() : null;
      },
      distanceBased: (distance) {
        final meters = (distance % 1000).toInt();
        return meters != 0 ? meters.toString() : null;
      },
      repsOnly: (sets, reps) => reps != 0 ? reps.toString() : null,
    );
  }

  String? get _thirdInputInitialValue {
    if (!_hasThirdInput) return null;
    return _workingSet.when(
      weightBased: (sets, reps, weight) =>
          weight != 0 ? weight.toStringAsFixed(1) : null,
      timeBased: (duration) => null,
      distanceBased: (distance) => null,
      repsOnly: (sets, reps) => null,
    );
  }

  int get _firstInputMaxLength {
    switch (widget.type) {
      case WorkingSetType.weightBased:
      case WorkingSetType.repsOnly:
        return 2; // sets
      case WorkingSetType.timeBased:
        return 3; // minutes
      case WorkingSetType.distanceBased:
        return 3; // km
    }
  }

  int get _secondInputMaxLength {
    switch (widget.type) {
      case WorkingSetType.weightBased:
      case WorkingSetType.repsOnly:
        return 3; // reps
      case WorkingSetType.timeBased:
        return 2; // seconds (0-59)
      case WorkingSetType.distanceBased:
        return 3; // meters (0-999)
    }
  }

  int get _thirdInputMaxLength {
    return 5; // weight (e.g., 100.5)
  }

  String get _firstInputLabel {
    switch (widget.type) {
      case WorkingSetType.weightBased:
      case WorkingSetType.repsOnly:
        return AppConstants.sets.toLowerCase();
      case WorkingSetType.timeBased:
        return AppConstants.mins.toLowerCase();
      case WorkingSetType.distanceBased:
        return AppConstants.km.toLowerCase();
    }
  }

  String get _secondInputLabel {
    switch (widget.type) {
      case WorkingSetType.weightBased:
      case WorkingSetType.repsOnly:
        return AppConstants.reps.toLowerCase();
      case WorkingSetType.timeBased:
        return AppConstants.secs.toLowerCase();
      case WorkingSetType.distanceBased:
        return AppConstants.meters.toLowerCase();
    }
  }

  String get _thirdInputLabel {
    return AppConstants.kg.toLowerCase();
  }

  void _onFirstInputChanged(String value) {
    final parsedValue = int.tryParse(value) ?? 0;
    _workingSet = _updateFirstInput(parsedValue);
    widget.onEdit(_workingSet);
  }

  void _onSecondInputChanged(String value) {
    final parsedValue = int.tryParse(value) ?? 0;
    _workingSet = _updateSecondInput(parsedValue);
    widget.onEdit(_workingSet);
  }

  void _onThirdInputChanged(String value) {
    final parsedValue = double.tryParse(value) ?? 0.0;
    _workingSet = _updateThirdInput(parsedValue);
    widget.onEdit(_workingSet);
  }

  WorkingSet _updateFirstInput(int value) {
    return _workingSet.when(
      weightBased: (sets, reps, weight) =>
          WorkingSet.weightBased(sets: value, reps: reps, weight: weight),
      timeBased: (duration) {
        // Combine new minutes with existing seconds
        final minutes = value;
        final seconds = duration.inSeconds % 60;
        return WorkingSet.timeBased(
          duration: Duration(seconds: minutes * 60 + seconds),
        );
      },
      distanceBased: (distance) {
        // Combine new km with existing meters
        final km = value;
        final meters = (distance % 1000).toInt();
        return WorkingSet.distanceBased(distance: km * 1000.0 + meters);
      },
      repsOnly: (sets, reps) => WorkingSet.repsOnly(sets: value, reps: reps),
    );
  }

  WorkingSet _updateSecondInput(int value) {
    return _workingSet.when(
      weightBased: (sets, reps, weight) =>
          WorkingSet.weightBased(sets: sets, reps: value, weight: weight),
      timeBased: (duration) {
        // Combine existing minutes with new seconds
        final minutes = duration.inSeconds ~/ 60;
        return WorkingSet.timeBased(
          duration: Duration(seconds: minutes * 60 + value),
        );
      },
      distanceBased: (distance) {
        // Combine existing km with new meters
        final km = (distance ~/ 1000).toInt();
        return WorkingSet.distanceBased(distance: km * 1000.0 + value);
      },
      repsOnly: (sets, reps) => WorkingSet.repsOnly(sets: sets, reps: value),
    );
  }

  WorkingSet _updateThirdInput(double value) {
    return _workingSet.when(
      weightBased: (sets, reps, weight) =>
          WorkingSet.weightBased(sets: sets, reps: reps, weight: value),
      timeBased: (duration) => _workingSet, // No third input
      distanceBased: (distance) => _workingSet, // No third input
      repsOnly: (sets, reps) => _workingSet, // No third input
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({
    required this.label,
    required this.onChanged,
    this.maxLength = 3,
    this.initialValue,
    this.allowDecimal = false,
  });

  final String label;
  final Function(String) onChanged;
  final int maxLength;
  final String? initialValue;
  final bool allowDecimal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 50.r,
          height: 50.r,
          child: CommonTextField(
            initialValue: initialValue,
            onChanged: onChanged,
            backgroundColor: AppColors.grayBlue,
            contentPadding: EdgeInsets.zero,
            textAlign: TextAlign.center,
            keyboardType: allowDecimal
                ? const TextInputType.numberWithOptions(decimal: true)
                : TextInputType.number,
            inputFormatters: allowDecimal
                ? [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,1}'))]
                : [FilteringTextInputFormatter.digitsOnly],
            maxLength: maxLength,
            hintText: '',
            radius: 12.r,
          ),
        ),
        Gaps.hGap10,
        Flexible(
          child: Text(
            label,
            style: AppTextStyles.h5,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
