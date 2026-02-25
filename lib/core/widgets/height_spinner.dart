import 'package:flutter/material.dart';
import 'package:workouch/core/extension/double_extension.dart';

import '../../features/auth/domain/entities/user.dart';
import '../constants/app_constants.dart';
import 'common_gaps.dart';
import 'common_spinner.dart';

class HeightSpinner extends StatelessWidget {
  const HeightSpinner({
    super.key,
    required this.measurementSystem,
    required this.initialHeightCm,
    required this.onHeightChanged,
  });

  final MeasurementSystem measurementSystem;
  final double initialHeightCm;
  final ValueChanged<double> onHeightChanged;

  @override
  Widget build(BuildContext context) {
    switch (measurementSystem) {
      case MeasurementSystem.metric:
        return _HeightMetricSpinner(
          initialHeightCm: initialHeightCm,
          onChanged: onHeightChanged,
        );
      case MeasurementSystem.imperial:
        return _HeightImperialSpinner(
          initialHeightCm: initialHeightCm,
          onChanged: onHeightChanged,
        );
    }
  }
}

class _HeightMetricSpinner extends StatelessWidget {
  const _HeightMetricSpinner({
    required this.initialHeightCm,
    required this.onChanged,
  });

  final double initialHeightCm;
  final ValueChanged<double> onChanged;

  static const minCm = 50;
  static const maxCm = 300;

  @override
  Widget build(BuildContext context) {
    final items = List<SpinnerItem<double>>.generate(maxCm - minCm + 1, (i) {
      final value = (minCm + i).toDouble();
      return SpinnerItem<double>(
        label: '${value.toStringAsFixed(0)} ${AppConstants.cm.toLowerCase()}',
        item: value,
      );
    });

    final initialIndex = (initialHeightCm - minCm).round();

    return CommonSpinner<double>(
      items: items,
      initialItem: initialIndex,
      onSelected: (index) {
        final value = (minCm + index).toDouble();
        onChanged(value);
      },
    );
  }
}

class _HeightImperialSpinner extends StatefulWidget {
  const _HeightImperialSpinner({
    required this.initialHeightCm,
    required this.onChanged,
  });

  final double initialHeightCm;
  final ValueChanged<double> onChanged;

  @override
  State<_HeightImperialSpinner> createState() => _HeightImperialSpinnerState();
}

class _HeightImperialSpinnerState extends State<_HeightImperialSpinner> {
  final minFeet = 1;
  final maxFeet = 9;
  final minInch = 0;
  final maxInch = 11;

  var currFeet = 0;
  var currInches = 0;
  var feetValues = <int>[];
  var inchValues = <int>[];

  @override
  void initState() {
    super.initState();
    final initialHeightIn = widget.initialHeightCm.cmToIn;
    currFeet = (initialHeightIn / 12).floor().clamp(minFeet, maxFeet);
    currInches = (initialHeightIn % 12).round().clamp(minInch, maxInch);
    feetValues = List<int>.generate(maxFeet - minFeet + 1, (i) => minFeet + i);
    inchValues = List<int>.generate(maxInch - minInch + 1, (i) => minInch + i);
  }

  @override
  Widget build(BuildContext context) {
    final currFeetIndex = feetValues
        .indexWhere((value) => value == currFeet)
        .clamp(0, feetValues.length - 1);
    final currInchIndex = inchValues
        .indexWhere((value) => value == currInches)
        .clamp(0, inchValues.length - 1);

    return Row(
      children: [
        Expanded(
          child: CommonSpinner<int>(
            items: feetValues
                .map(
                  (f) => SpinnerItem<int>(
                    label: '$f ${AppConstants.ft.toLowerCase()}',
                    item: f,
                  ),
                )
                .toList(),
            initialItem: currFeetIndex,
            onSelected: (i) {
              setState(() {
                currFeet = feetValues[i];
              });
              final updatedHeightCm = _calculateHeightCm();
              widget.onChanged(updatedHeightCm);
            },
          ),
        ),
        Gaps.hGap12,
        Expanded(
          child: CommonSpinner<int>(
            items: inchValues
                .map(
                  (i) => SpinnerItem<int>(
                    label: '$i ${AppConstants.inch.toLowerCase()}',
                    item: i,
                  ),
                )
                .toList(),
            initialItem: currInchIndex,
            onSelected: (i) {
              setState(() {
                currInches = inchValues[i];
              });
              final updatedHeightCm = _calculateHeightCm();
              widget.onChanged(updatedHeightCm);
            },
          ),
        ),
      ],
    );
  }

  double _calculateHeightCm() {
    return (currFeet * 12 + currInches).toDouble().inToCm;
  }
}
