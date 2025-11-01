import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';

class WorkoutExerciseCard extends StatefulWidget {
  const WorkoutExerciseCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.onSelected,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onSelected;

  @override
  State<WorkoutExerciseCard> createState() => _WorkoutExerciseCardState();
}

class _WorkoutExerciseCardState extends State<WorkoutExerciseCard>
    with TickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _pressController;
  late AnimationController _expandController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();
    _pressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: _pressController, curve: Curves.easeInOut),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _expandController, curve: Curves.easeInOut),
    );

    _heightAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _expandController, curve: Curves.easeInOut),
    );
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _expandController.forward();
      } else {
        _expandController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _pressController.dispose();
    _expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _pressController.forward(),
      onTapUp: (_) {
        _pressController.reverse();
        widget.onSelected?.call();
      },
      onTapCancel: () => _pressController.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: CommonAssetIcon(
                      Assets.icons.weight,
                      width: 36.r,
                      height: 36.r,
                      useDefaultColor: true,
                    ),
                  ),
                  Gaps.hGap12,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: AppTextStyles.h4.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Gaps.vGap4,
                        Text(
                          widget.subtitle,
                          style: AppTextStyles.h5.copyWith(
                            color: AppColors.mediumGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ClipRect(
                child: SizeTransition(
                  sizeFactor: _heightAnimation,
                  axisAlignment: -1.0,
                  child: FadeTransition(
                    opacity: _heightAnimation,
                    child: Column(
                      children: [
                        Gaps.vGap16,
                        Row(
                          children: [
                            CommonAssetIcon(
                              Assets.icons.work,
                              width: 16.r,
                              height: 16.r,
                              color: AppColors.black,
                            ),
                            Gaps.hGap10,
                            Text(
                              '3 sets x 10 reps x 80 kg',
                              style: AppTextStyles.h5,
                            ),
                          ],
                        ),
                        Gaps.vGap8,
                        Row(
                          children: [
                            CommonAssetIcon(
                              Assets.icons.clock,
                              width: 16.r,
                              height: 16.r,
                              color: AppColors.black,
                            ),
                            Gaps.hGap10,
                            Text('1m30s', style: AppTextStyles.h5),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Gaps.vGap16,
              AnimatedBuilder(
                animation: _rotationAnimation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotationAnimation.value * math.pi, // 180 degrees
                    child: CommonIconButton(
                      icon: Assets.icons.arrowDown,
                      onTap: _toggleExpand,
                      iconColor: AppColors.black,
                      iconSize: 20.r,
                      padding: EdgeInsets.zero,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
