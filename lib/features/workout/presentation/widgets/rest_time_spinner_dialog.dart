import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_bottom_dialog.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../core/widgets/common_spinner.dart';
import '../../../../gen/assets.gen.dart';

Future<dynamic> showRestTimeSpinnerDialog(
  BuildContext context, {
  required String title,
  Duration? initialValue,
}) async {
  return await showCommonBottomDialog(
    context,
    child: _RestTimeSpinnerDialog(title: title, initialValue: initialValue),
  );
}

class _RestTimeSpinnerDialog extends StatefulWidget {
  const _RestTimeSpinnerDialog({required this.title, this.initialValue});

  final String title;
  final Duration? initialValue;

  @override
  State<_RestTimeSpinnerDialog> createState() => _RestTimeSpinnerDialogState();
}

class _RestTimeSpinnerDialogState extends State<_RestTimeSpinnerDialog> {
  late var _restTime = widget.initialValue ?? const Duration();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonAssetIcon(
              Assets.icons.rest,
              color: AppColors.black,
              width: 20.r,
              height: 20.r,
            ),
            Gaps.hGap10,
            Flexible(
              child: DefaultTextStyle(
                style: AppTextStyles.h3,
                child: Text(widget.title),
              ),
            ),
          ],
        ),
        Gaps.vGap20,
        Row(
          children: [
            Expanded(
              child: CommonSpinner(
                height: 80.h,
                initialItem: _restTime.inMinutes % 60,
                items: AppConstants.timeConst.mins
                    .map((item) => SpinnerItem(label: '$item', item: item))
                    .toList(),
                onSelected: (i) {
                  _restTime = Duration(
                    minutes: AppConstants.timeConst.mins[i],
                    seconds: _restTime.inSeconds % 60,
                  );
                },
              ),
            ),
            DefaultTextStyle(
              style: AppTextStyles.h4.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.text,
              ),
              child: const Text(':'),
            ),
            Expanded(
              child: CommonSpinner(
                height: 80.h,
                initialItem: _restTime.inSeconds % 60,
                items: AppConstants.timeConst.secs
                    .map((item) => SpinnerItem(label: '$item', item: item))
                    .toList(),
                onSelected: (i) {
                  _restTime = Duration(
                    minutes: _restTime.inMinutes % 60,
                    seconds: AppConstants.timeConst.secs[i],
                  );
                },
              ),
            ),
          ],
        ),
        Gaps.vGap20,
        CommonButton(
          text: AppConstants.confirm,
          textStyle: AppTextStyles.h4.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
          onPressed: () {
            context.pop(_restTime);
          },
        ),
      ],
    );
  }
}
