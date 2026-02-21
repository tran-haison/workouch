import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../core/widgets/common_text_field.dart';
import '../../../../gen/assets.gen.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/personal_records_card_selectable.dart';

class PersonalRecordsPage extends StatefulWidget {
  const PersonalRecordsPage({super.key});

  @override
  State<PersonalRecordsPage> createState() => _PersonalRecordsPageState();
}

class _PersonalRecordsPageState extends State<PersonalRecordsPage> {
  final _searchController = TextEditingController();
  Timer? _searchDebounce;
  var _isSearchVisible = false;

  @override
  void dispose() {
    _searchDebounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                  child: Column(
                    children: [
                      _buildHeader(),
                      _buildAnimatedSearchField(),
                      Gaps.vGap16,
                    ],
                  ),
                ),
                Expanded(
                  child: BlocBuilder<HomeCubit, HomeState>(
                    buildWhen: (prev, curr) =>
                        prev.status != curr.status ||
                        prev.personalRecords != curr.personalRecords ||
                        prev.selectedPersonalRecords !=
                            curr.selectedPersonalRecords,
                    builder: (context, state) {
                      if (state.status == HomeStateStatus.loading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.black,
                          ),
                        );
                      }

                      if (state.status == HomeStateStatus.error) {
                        return _buildErrorState();
                      }

                      if (state.personalRecords.isEmpty) {
                        return _buildEmptyState();
                      }

                      return _buildPRList();
                    },
                  ),
                ),
              ],
            ),
            if (context
                .watch<HomeCubit>()
                .state
                .selectedPersonalRecords
                .isNotEmpty)
              _buildSelectedCount(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        CommonIconButton(
          backgroundColor: AppColors.grayBlue,
          icon: Assets.icons.close,
          iconColor: AppColors.black,
          onTap: () => context.pop(),
        ),
        Gaps.hGap16,
        Expanded(
          child: Text(
            AppConstants.all,
            style: AppTextStyles.h1.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Gaps.hGap16,
        CommonIconButton(
          icon: Assets.icons.search,
          iconColor: AppColors.black,
          backgroundColor: _isSearchVisible
              ? AppColors.secondary
              : AppColors.grayBlue,
          onTap: _toggleSearch,
        ),
      ],
    );
  }

  Widget _buildAnimatedSearchField() {
    return AnimatedSize(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      alignment: Alignment.topCenter,
      child: Visibility(
        visible: _isSearchVisible,
        maintainState: true,
        maintainSize: false,
        maintainAnimation: true,
        maintainInteractivity: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gaps.vGap16,
            CommonTextField(
              controller: _searchController,
              hintText: AppConstants.searchByName,
              backgroundColor: AppColors.grayBlue,
              prefix: CommonAssetIcon(
                Assets.icons.search,
                width: 20.r,
                height: 20.r,
                color: AppColors.black,
              ),
              suffix: _searchController.text.isNotEmpty
                  ? CommonIconButton(
                      icon: Assets.icons.close,
                      iconSize: 20.r,
                      iconColor: AppColors.black,
                      padding: EdgeInsets.zero,
                      onTap: () {
                        _clearSearch();
                      },
                    )
                  : null,
              onChanged: _onSearchChanged,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPRList() {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (prev, curr) =>
          prev.personalRecords != curr.personalRecords ||
          prev.selectedPersonalRecords != curr.selectedPersonalRecords,
      builder: (context, state) {
        return ListView.separated(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 80.h),
          itemCount: state.personalRecords.length,
          separatorBuilder: (_, _) => Gaps.vGap10,
          itemBuilder: (context, index) {
            final pr = state.personalRecords[index];
            final isSelected = state.selectedPersonalRecords.any(
              (e) => e.exerciseId == pr.exerciseId,
            );

            return PersonalRecordsCardSelectable(
              personalRecord: pr,
              isSelected: isSelected,
              onTap: () {
                context.read<HomeCubit>().togglePersonalRecordSelection(pr);
              },
            );
          },
        );
      },
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppConstants.commonError,
            style: AppTextStyles.h4,
            textAlign: TextAlign.center,
          ),
          Gaps.vGap16,
          CommonButton(
            text: AppConstants.retry,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            textStyle: AppTextStyles.h5.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
            isFullWidth: false,
            onPressed: () => context.read<HomeCubit>().getAllPersonalRecords(),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Text(
        AppConstants.noExerciseFound,
        style: AppTextStyles.h4.copyWith(color: AppColors.mediumGray),
      ),
    );
  }

  Widget _buildSelectedCount() {
    return Positioned(
      bottom: 10.h,
      right: 0,
      left: 0,
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (prev, curr) =>
            prev.selectedPersonalRecords != curr.selectedPersonalRecords,
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary,
                      blurRadius: 10,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: CommonButton(
                  isFullWidth: false,
                  text:
                      '${state.selectedPersonalRecords.length} ${AppConstants.selected}'
                          .toLowerCase(),
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  onPressed: () {},
                  textStyle: AppTextStyles.h5,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _onSearchChanged(String value) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(
      Duration(milliseconds: AppConstants.timeConst.searchDebounce),
      () {
        // Update search and get PRs with the new search
        context.read<HomeCubit>().getAllPersonalRecords(searchByName: value);
      },
    );
  }

  void _toggleSearch() {
    if (_isSearchVisible) {
      _clearSearch();
      setState(() => _isSearchVisible = false);
    } else {
      setState(() => _isSearchVisible = true);
    }
  }

  void _clearSearch() {
    _searchController.clear();
    _onSearchChanged('');
  }
}
