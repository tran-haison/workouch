import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workouch/core/widgets/common_icons.dart';

import '../../../gen/assets.gen.dart';
import '../theme/app_colors.dart';

class CommonDismissible extends StatelessWidget {
  const CommonDismissible({
    required this.child,
    required this.onDismissed,
    required this.id,
    super.key,
  });

  final Widget child;
  final VoidCallback onDismissed;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      confirmDismiss: (direction) {
        // Swipe from right to left to delete
        if (direction == DismissDirection.endToStart) {
          return Future.value(true);
        }
        return Future.value(false);
      },
      background: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CommonAssetIcon(
            Assets.icons.delete,
            width: 20.r,
            height: 20.r,
            color: AppColors.errorDark,
          ),
        ],
      ),
      onDismissed: (_) => onDismissed(),
      child: child,
    );
  }
}
