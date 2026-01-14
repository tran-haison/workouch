import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../gen/assets.gen.dart';

class OnboardIntroFeature5 extends StatefulWidget {
  const OnboardIntroFeature5({super.key});

  @override
  State<OnboardIntroFeature5> createState() => _OnboardIntroFeature5State();
}

class _OnboardIntroFeature5State extends State<OnboardIntroFeature5> {
  late ScrollController _scrollController1;
  late ScrollController _scrollController2;
  late ScrollController _scrollController3;
  Timer? _scrollTimer1;
  Timer? _scrollTimer2;
  Timer? _scrollTimer3;

  // 9 exercise images divided into 3 lists
  final List<String> _list1Images = [
    Assets.images.imgSampleExercise1.path,
    Assets.images.imgSampleExercise2.path,
    Assets.images.imgSampleExercise3.path,
  ];
  final List<String> _list2Images = [
    Assets.images.imgSampleExercise4.path,
    Assets.images.imgSampleExercise5.path,
    Assets.images.imgSampleExercise6.path,
  ];
  final List<String> _list3Images = [
    Assets.images.imgSampleExercise7.path,
    Assets.images.imgSampleExercise8.path,
    Assets.images.imgSampleExercise9.path,
  ];

  @override
  void initState() {
    super.initState();
    _scrollController1 = ScrollController();
    _scrollController2 = ScrollController();
    _scrollController3 = ScrollController();

    // Start auto-scrolling after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() {
    // List 1: Scroll right to left (forward)
    _scrollTimer1 = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (!mounted || !_scrollController1.hasClients) return;
      final currentScroll = _scrollController1.position.pixels;
      final itemWidth = 80.r + 12.w; // width + margin
      final listWidth = itemWidth * 3; // 3 items per list

      if (currentScroll >= listWidth) {
        // Reset to start of first set when reaching end of second set
        _scrollController1.jumpTo(currentScroll - listWidth);
      } else {
        _scrollController1.jumpTo(currentScroll + 0.5);
      }
    });

    // List 2: Scroll left to right (backwards scrolling)
    _scrollTimer2 = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (!mounted || !_scrollController2.hasClients) return;
      final currentScroll = _scrollController2.position.pixels;
      final maxScroll = _scrollController2.position.maxScrollExtent;

      // Scroll backwards (decrease pixels) to achieve left-to-right visual effect
      // Start at maxScrollExtent (rightmost) and scroll backwards (decrease) to move left-to-right
      if (currentScroll <= 0) {
        // Reset to rightmost position when reaching leftmost
        _scrollController2.jumpTo(maxScroll);
      } else {
        // Decrease pixels to scroll backwards (left-to-right visually)
        _scrollController2.jumpTo(currentScroll - 0.5);
      }
    });

    // List 3: Scroll right to left (forward)
    _scrollTimer3 = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      if (!mounted || !_scrollController3.hasClients) return;
      final currentScroll = _scrollController3.position.pixels;
      final itemWidth = 80.r + 12.w; // width + margin
      final listWidth = itemWidth * 3; // 3 items per list

      if (currentScroll >= listWidth) {
        // Reset to start of first set when reaching end of second set
        _scrollController3.jumpTo(currentScroll - listWidth);
      } else {
        _scrollController3.jumpTo(currentScroll + 0.5);
      }
    });
  }

  @override
  void dispose() {
    _scrollTimer1?.cancel();
    _scrollTimer2?.cancel();
    _scrollTimer3?.cancel();
    _scrollController1.dispose();
    _scrollController2.dispose();
    _scrollController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildScrollableList(
          controller: _scrollController1,
          images: _list1Images,
        ),
        Gaps.vGap12,
        _buildScrollableList(
          controller: _scrollController2,
          images: _list2Images,
        ),
        Gaps.vGap12,
        _buildScrollableList(
          controller: _scrollController3,
          images: _list3Images,
        ),
      ],
    );
  }

  Widget _buildScrollableList({
    required ScrollController controller,
    required List<String> images,
  }) {
    // Duplicate images for infinite scroll effect
    final duplicatedImages = [...images, ...images, ...images];

    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemCount: duplicatedImages.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 12.w),
            width: 80.r,
            height: 80.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.grayBlue, width: 1.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                duplicatedImages[index],
                width: 80.r,
                height: 80.r,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
