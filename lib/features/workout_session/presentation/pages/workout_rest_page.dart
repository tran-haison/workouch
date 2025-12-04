import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:workouch/core/extension/duration_extension.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../gen/assets.gen.dart';
import '../cubit/workout_session_cubit.dart';
import '../cubit/workout_session_state.dart';

class _PopUpText {
  String text;
  Offset position;

  _PopUpText({required this.text, required this.position});

  void update(String newText, Offset newPosition) {
    text = newText;
    position = newPosition;
  }
}

class WorkoutRestPage extends StatefulWidget {
  const WorkoutRestPage({super.key});

  @override
  State<WorkoutRestPage> createState() => _WorkoutRestPageState();
}

class _WorkoutRestPageState extends State<WorkoutRestPage>
    with TickerProviderStateMixin {
  _PopUpText? _currentPopUp;
  final math.Random _random = math.Random();
  final GlobalKey _containerKey = GlobalKey();
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    // Create single AnimationController instance for pop-up animations
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // Create animations once, bound to the shared controller
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOut),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, -0.5)).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.0, 1.0, curve: Curves.easeOut),
          ),
        );

    // Listen for animation completion
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        setState(() {
          _currentPopUp = null;
        });
      }
    });

    // Start the rest timer when page appears
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final cubit = context.read<WorkoutSessionCubit>();
        final state = cubit.state;
        if (state.hasRestBetweenExercises && !state.isRestExercisesActive) {
          cubit.startRestExercisesTimer(state.workout.restTimeBetweenExercises);
        }
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _currentPopUp = null;
    super.dispose();
  }

  void _showPopUpText(String text) {
    // Use post-frame callback to ensure the container is laid out
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      // Get the white container's bounds
      final containerRenderBox =
          _containerKey.currentContext?.findRenderObject() as RenderBox?;
      if (containerRenderBox == null) return;

      // Get the Stack's RenderBox to calculate relative position
      final stackRenderBox = context.findRenderObject() as RenderBox?;
      if (stackRenderBox == null) return;

      // Get global positions
      final containerGlobalPos = containerRenderBox.localToGlobal(Offset.zero);
      final stackGlobalPos = stackRenderBox.localToGlobal(Offset.zero);

      // Calculate position relative to Stack
      final containerRelativePos = containerGlobalPos - stackGlobalPos;
      final containerSize = containerRenderBox.size;

      // Generate random position within the white container (with padding to avoid edges)
      final padding = 20.0;
      final x =
          containerRelativePos.dx +
          padding +
          _random.nextDouble() * (containerSize.width - padding * 2);
      final y =
          containerRelativePos.dy +
          padding +
          _random.nextDouble() * (containerSize.height - padding * 2);

      final newPosition = Offset(x, y);

      // Stop and reset the shared controller if animation is in progress
      if (_animationController.isAnimating) {
        _animationController.stop();
      }
      _animationController.reset();

      // Update or create pop-up text
      if (_currentPopUp != null) {
        _currentPopUp!.update(text, newPosition);
      } else {
        _currentPopUp = _PopUpText(text: text, position: newPosition);
      }

      setState(() {});

      // Start animation with the shared controller
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WorkoutSessionCubit, WorkoutSessionState>(
      listener: (context, state) {
        // Navigate back to execution page when rest timer completes automatically
        if (!state.isRestExercisesActive &&
            state.restExercisesRemain == Duration.zero) {
          // Only navigate if we're still on this page
          if (mounted && context.canPop()) {
            // Advance to next exercise if available
            final cubit = context.read<WorkoutSessionCubit>();
            if (state.hasNextExercise) {
              cubit.goNextExercise();
            }
            // Small delay to ensure state update is processed
            Future.microtask(() {
              if (mounted && context.canPop()) {
                context.pop();
              }
            });
          }
        }
      },
      child: BlocBuilder<WorkoutSessionCubit, WorkoutSessionState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.black.withValues(alpha: 0.5),
                    ),
                    child: Center(
                      child: Container(
                        key: _containerKey,
                        margin: EdgeInsets.symmetric(
                          horizontal: 40.w,
                          vertical: 20.h,
                        ),
                        padding: EdgeInsets.all(30.r),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppConstants.restTime,
                              style: AppTextStyles.h3.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Gaps.vGap16,
                            Text(
                              state.restExercisesRemain.mmss,
                              style: AppTextStyles.h0.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Gaps.vGap20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonIconButton(
                                  icon: Assets.icons.arrowDown,
                                  iconColor: AppColors.black,
                                  backgroundColor: AppColors.grayBlue,
                                  radius: 12.r,
                                  onTap: () {
                                    context
                                        .read<WorkoutSessionCubit>()
                                        .decreaseRestExercises(10);
                                    _showPopUpText('-10');
                                  },
                                ),
                                Gaps.hGap16,
                                CommonIconButton(
                                  icon: Assets.icons.arrowUp,
                                  iconColor: AppColors.black,
                                  backgroundColor: AppColors.grayBlue,
                                  radius: 12.r,
                                  onTap: () {
                                    context
                                        .read<WorkoutSessionCubit>()
                                        .increaseRestExercises(10);
                                    _showPopUpText('+10');
                                  },
                                ),
                              ],
                            ),
                            Gaps.vGap24,
                            CommonButton(
                              text: AppConstants.skipRest,
                              backgroundColor: AppColors.grayBlue,
                              textStyle: AppTextStyles.h4.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                              onPressed: () {
                                context
                                    .read<WorkoutSessionCubit>()
                                    .stopRestExercisesTimer();
                                // Advance to next exercise and navigate back
                                if (state.hasNextExercise) {
                                  context
                                      .read<WorkoutSessionCubit>()
                                      .goNextExercise();
                                }
                                if (mounted) {
                                  context.pop();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Overlay for pop-up text (only one at a time)
                  if (_currentPopUp != null)
                    Positioned(
                      left: _currentPopUp!.position.dx,
                      top: _currentPopUp!.position.dy,
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: Text(
                            _currentPopUp!.text,
                            style: AppTextStyles.h2.copyWith(
                              fontWeight: FontWeight.w700,
                              color: _currentPopUp!.text.startsWith('+')
                                  ? Colors.green
                                  : Colors.red,
                              shadows: [
                                Shadow(
                                  offset: Offset(0, 2.r),
                                  blurRadius: 4.r,
                                  color: AppColors.black.withValues(alpha: 0.3),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
