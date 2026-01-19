import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../gen/assets.gen.dart';
import '../theme/app_colors.dart';
import 'common_gaps.dart';
import 'common_icons.dart';

class CommonBottomNavbar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CommonBottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CommonBottomNavbar> createState() => _CommonBottomNavbarState();
}

class _CommonBottomNavbarState extends State<CommonBottomNavbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  double _selectedOffset = 0.0;
  double _targetOffset = 0.0;
  final _itemSize = 60.0;
  final _gap = 8.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _updateOffset(widget.currentIndex);
  }

  @override
  void didUpdateWidget(CommonBottomNavbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      _updateOffset(widget.currentIndex);
      _animationController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _updateOffset(int index) {
    setState(() {
      _selectedOffset = _targetOffset;
      _targetOffset = index * (_itemSize + _gap);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(4.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(50.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.grayBlue,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                final currentOffset =
                    _selectedOffset +
                    (_targetOffset - _selectedOffset) * _animation.value;
                return Positioned(
                  left: currentOffset.r,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: _itemSize.r,
                    decoration: BoxDecoration(
                      color: AppColors.darkBlack,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                );
              },
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildNavItem(context, Assets.icons.grid, 0),
                Gaps.hGap(_gap),
                _buildNavItem(context, Assets.icons.analytics, 1),
                Gaps.hGap(_gap),
                _buildNavItem(context, Assets.icons.track, 2),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, SvgGenImage icon, int index) {
    final isSelected = widget.currentIndex == index;

    return GestureDetector(
      onTap: () => widget.onTap(index),
      child: Container(
        width: _itemSize.r,
        height: _itemSize.r,
        decoration: BoxDecoration(
          color: AppColors.transparent,
          borderRadius: BorderRadius.circular(30.r),
        ),
        padding: EdgeInsets.all(18.r),
        child: CommonAssetIcon(
          icon,
          color: isSelected ? AppColors.white : AppColors.black,
        ),
      ),
    );
  }
}
