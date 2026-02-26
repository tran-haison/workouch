import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workouch/core/extension/double_extension.dart';
import 'package:workouch/features/auth/domain/entities/user.dart';

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
    required this.measurementSystem,
    this.showDeleteButton = true,
    this.initialWorkingSet,
    super.key,
  });

  final Function(WorkingSet workingSet) onEdit;
  final VoidCallback onDelete;
  final WorkingSetType type;
  final MeasurementSystem measurementSystem;
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
          allowDecimal:
              widget.type.isDistanceBased &&
              widget.measurementSystem.isImperial,
        ),
        // Second input field (hidden for distance in imperial)
        if (_hasSecondInput) ...[
          Gaps.hGap10,
          _InputField(
            initialValue: _secondInputInitialValue,
            label: _secondInputLabel,
            onChanged: _onSecondInputChanged,
            maxLength: _secondInputMaxLength,
            allowDecimal: false,
          ),
        ],
        // Third input field (only for weightBased)
        if (_hasThirdInput) ...[
          Gaps.hGap10,
          _InputField(
            initialValue: _thirdInputInitialValue,
            label: _thirdInputLabel,
            onChanged: _onThirdInputChanged,
            maxLength: _thirdInputMaxLength,
            allowDecimal: widget.measurementSystem.isMetric,
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

  bool get _hasSecondInput {
    return !(widget.type.isDistanceBased &&
        widget.measurementSystem.isImperial);
  }

  bool get _hasThirdInput {
    return widget.type.isWeightBased;
  }

  String? get _firstInputInitialValue {
    return _workingSet.when(
      weightBased: (sets, reps, weight) => sets != 0 ? sets.toString() : null,
      timeBased: (duration) => duration.inSeconds != 0
          ? (duration.inSeconds ~/ 60).toString()
          : null, // Show minutes
      distanceBased: (distanceMeters) {
        if (distanceMeters == 0) return null;
        return widget.measurementSystem.isMetric
            ? (distanceMeters ~/ 1000).toString()
            : (distanceMeters.meterToMile).toStringAsFixed(2);
      },
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
      distanceBased: (distanceMeters) {
        if (widget.measurementSystem.isImperial) return null;
        final meters = (distanceMeters % 1000).toInt();
        return meters != 0 ? meters.toString() : null;
      },
      repsOnly: (sets, reps) => reps != 0 ? reps.toString() : null,
    );
  }

  String? get _thirdInputInitialValue {
    if (!_hasThirdInput) return null;
    return _workingSet.when(
      weightBased: (sets, reps, weightKg) {
        if (weightKg == 0) return null;
        return widget.measurementSystem.isMetric
            ? weightKg.toStringAsFixed(1)
            : weightKg.kgToLbs.round().toString();
      },
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
        return widget.measurementSystem.isMetric ? 3 : 6; // km or miles
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
        return widget.measurementSystem.isMetric
            ? 3 // meters (0-999)
            : 0; // (no second input for imperial)
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
        return widget.measurementSystem.isMetric
            ? AppConstants.km.toLowerCase()
            : AppConstants.miles.toLowerCase();
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
        return widget.measurementSystem.isMetric
            ? AppConstants.meters.toLowerCase()
            : '';
    }
  }

  String get _thirdInputLabel {
    return widget.measurementSystem.isMetric
        ? AppConstants.kg.toLowerCase()
        : AppConstants.lbs.toLowerCase();
  }

  void _onFirstInputChanged(String value) {
    final parsedValue = double.tryParse(value) ?? 0.0;
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

  WorkingSet _updateFirstInput(double value) {
    return _workingSet.when(
      weightBased: (_, reps, weight) => WorkingSet.weightBased(
        sets: value.toInt(),
        reps: reps,
        weightKg: weight,
      ),
      timeBased: (duration) {
        // Combine new minutes with existing seconds
        final minutes = value.toInt();
        final seconds = duration.inSeconds % 60;
        return WorkingSet.timeBased(
          duration: Duration(seconds: minutes * 60 + seconds),
        );
      },
      distanceBased: (distanceMeters) {
        if (widget.measurementSystem.isImperial) {
          final meters = value.mileToMeter;
          return WorkingSet.distanceBased(distanceMeters: meters);
        }
        // Combine new km with existing meters (metric)
        final km = value.toInt();
        final meters = (distanceMeters % 1000).toInt();
        return WorkingSet.distanceBased(distanceMeters: km * 1000.0 + meters);
      },
      repsOnly: (_, reps) =>
          WorkingSet.repsOnly(sets: value.toInt(), reps: reps),
    );
  }

  WorkingSet _updateSecondInput(int value) {
    return _workingSet.when(
      weightBased: (sets, _, weight) =>
          WorkingSet.weightBased(sets: sets, reps: value, weightKg: weight),
      timeBased: (duration) {
        // Combine existing minutes with new seconds
        final minutes = duration.inSeconds ~/ 60;
        return WorkingSet.timeBased(
          duration: Duration(seconds: minutes * 60 + value),
        );
      },
      distanceBased: (distanceMeters) {
        if (widget.measurementSystem.isImperial) {
          // No second input for imperial
          return _workingSet;
        }
        // Combine existing km with new meters
        final km = (distanceMeters ~/ 1000).toInt();
        final meters = value;
        return WorkingSet.distanceBased(distanceMeters: km * 1000.0 + meters);
      },
      repsOnly: (sets, _) => WorkingSet.repsOnly(sets: sets, reps: value),
    );
  }

  WorkingSet _updateThirdInput(double value) {
    return _workingSet.when(
      weightBased: (sets, reps, _) {
        final weightKg = widget.measurementSystem.isMetric
            ? value
            : value.lbsToKg;

        return WorkingSet.weightBased(
          sets: sets,
          reps: reps,
          weightKg: weightKg,
        );
      },
      timeBased: (_) => _workingSet, // No third input
      distanceBased: (_) => _workingSet, // No third input
      repsOnly: (_, _) => _workingSet, // No third input
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
