import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../core/widgets/common_single_select_option_dialog.dart';
import '../../../../gen/assets.gen.dart';

class LazyLocationSelector extends StatefulWidget {
  const LazyLocationSelector({
    super.key,
    required this.initialLocation,
    required this.onChanged,
  });

  final String initialLocation;
  final ValueChanged<String> onChanged;

  @override
  State<LazyLocationSelector> createState() => _LazyLocationSelectorState();
}

class _LazyLocationSelectorState extends State<LazyLocationSelector> {
  late String _currentLocation;
  final locations = [
    AppConstants.locationLivingRoom,
    AppConstants.locationGarageBackyard,
    AppConstants.locationCommercialGym,
    AppConstants.locationHotelRoom,
    AppConstants.locationOutdoorsPark,
  ];

  @override
  void initState() {
    super.initState();
    _currentLocation = widget.initialLocation;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleLocationSelection,
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

  Future<void> _handleLocationSelection() async {
    final selected = await showCommonSingleSelectOptionDialog(
      context,
      items: locations,
      title: AppConstants.selectLocation,
      any: AppConstants.anyLocation,
      initialValue: _currentLocation,
    );

    if (mounted && selected is String) {
      setState(() {
        _currentLocation = selected == AppConstants.anyLocation
            ? AppConstants.anyLocation
            : selected;
      });
      widget.onChanged(_currentLocation);
    }
  }
}
