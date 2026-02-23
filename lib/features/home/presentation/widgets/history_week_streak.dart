import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../core/widgets/common_pop_up_dialog.dart';
import '../../../../gen/assets.gen.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

void _showWeekStreakExplanation(BuildContext context) {
  showCommonPopUpDialog(
    context,
    title: AppConstants.weekStreak,
    message: AppConstants.weekStreakExplanation,
    showSecondButton: false,
    firstButtonText: AppConstants.close,
  );
}

class HistoryWeekStreak extends StatelessWidget {
  const HistoryWeekStreak({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showWeekStreakExplanation(context),
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (prev, curr) => prev.weekStreak != curr.weekStreak,
            builder: (context, state) {
              return Text(
                state.weekStreak.toString(),
                style: AppTextStyles.h4.copyWith(
                  color: AppColors.orange,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
          Gaps.hGap8,
          CommonAssetIcon(
            Assets.icons.fire,
            width: 20.r,
            height: 20.r,
            color: AppColors.orange,
          ),
        ],
      ),
    );
  }
}
