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
import '../../../workout/domain/entities/exercise_filter.dart';
import '../../../workout/presentation/cubit/workout_cubit.dart';
import '../../../workout/presentation/dialogs/exercise_filter_dialog.dart';
import '../cubit/home_history_cubit.dart';
import '../cubit/home_history_state.dart';
import '../widgets/personal_records_card_selectable.dart';

class PersonalRecordsPage extends StatefulWidget {
  const PersonalRecordsPage({super.key});

  @override
  State<PersonalRecordsPage> createState() => _PersonalRecordsPageState();
}

class _PersonalRecordsPageState extends State<PersonalRecordsPage> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  Timer? _searchDebounce;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<HomeHistoryCubit>().getAllPRs();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
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
                      Gaps.vGap16,
                      _buildSearchAndFilter(),
                      Gaps.vGap16,
                    ],
                  ),
                ),
                Expanded(
                  child: BlocBuilder<HomeHistoryCubit, HomeHistoryState>(
                    builder: (context, state) {
                      if (state.status == HomeHistoryStatus.loading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.black,
                          ),
                        );
                      }

                      if (state.status == HomeHistoryStatus.error) {
                        return _buildErrorState();
                      }

                      if (state.allPRs.isEmpty) {
                        return _buildEmptyState();
                      }

                      return _buildPRList(state);
                    },
                  ),
                ),
              ],
            ),
            if (context
                .watch<HomeHistoryCubit>()
                .state
                .selectedPRIds
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
        BlocBuilder<HomeHistoryCubit, HomeHistoryState>(
          builder: (context, state) {
            if (state.selectedPRIds.isEmpty) return const SizedBox.shrink();
            return CommonButton(
              isFullWidth: false,
              text: AppConstants.reset,
              onPressed: () => _reset(),
              textStyle: AppTextStyles.h4,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              backgroundColor: AppColors.transparent,
            );
          },
        ),
      ],
    );
  }

  Widget _buildSearchAndFilter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: CommonTextField(
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
                      _searchController.clear();
                      _onSearchChanged('');
                    },
                  )
                : null,
            onChanged: _onSearchChanged,
          ),
        ),
        Gaps.hGap10,
        BlocBuilder<HomeHistoryCubit, HomeHistoryState>(
          builder: (context, state) {
            return CommonIconButton(
              icon: Assets.icons.filter,
              iconColor: AppColors.black,
              iconSize: 20.r,
              backgroundColor: state.filter.hasAnyFilter
                  ? AppColors.secondary
                  : AppColors.grayBlue,
              onTap: _showFilterDialog,
            );
          },
        ),
      ],
    );
  }

  Widget _buildPRList(HomeHistoryState state) {
    return ListView.separated(
      controller: _scrollController,
      padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 80.h),
      itemCount:
          state.allPRs.length +
          (state.status == HomeHistoryStatus.loadingMore ? 1 : 0),
      separatorBuilder: (_, _) => Gaps.vGap10,
      itemBuilder: (context, index) {
        if (index >= state.allPRs.length) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: const CircularProgressIndicator(color: AppColors.black),
            ),
          );
        }

        final pr = state.allPRs[index];
        final isSelected = state.isPRSelected(pr.exerciseId);

        return PersonalRecordsCardSelectable(
          pr: pr,
          isSelected: isSelected,
          onTap: () =>
              context.read<HomeHistoryCubit>().togglePRSelection(pr.exerciseId),
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
            onPressed: () => context.read<HomeHistoryCubit>().getAllPRs(),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Text(
        AppConstants.noPRsYet,
        style: AppTextStyles.h4.copyWith(color: AppColors.mediumGray),
      ),
    );
  }

  Widget _buildSelectedCount() {
    return Positioned(
      bottom: 10.h,
      right: 0,
      left: 0,
      child: BlocBuilder<HomeHistoryCubit, HomeHistoryState>(
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
                  text: '${state.selectedPRIds.length} ${AppConstants.selected}'
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

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<HomeHistoryCubit>().getAllPRs(loadMore: true);
    }
  }

  void _onSearchChanged(String value) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(
      Duration(milliseconds: AppConstants.timeConst.searchDebounce),
      () {
        // Update search and get PRs with the new search
        context.read<HomeHistoryCubit>().updateSearch(value);
        context.read<HomeHistoryCubit>().getAllPRs();
      },
    );
  }

  void _reset() {
    _searchController.clear();
    context.read<HomeHistoryCubit>().reset();
    context.read<HomeHistoryCubit>().getAllPRs();
  }

  Future<void> _showFilterDialog() async {
    final homeHistoryCubit = context.read<HomeHistoryCubit>();
    final workoutCubit = context.read<WorkoutCubit>();

    final muscles = workoutCubit.state.bodyParts;
    final equipments = workoutCubit.state.equipments;

    final filter = await showExerciseFilterDialog(
      context,
      muscles: muscles,
      equipments: equipments,
      initialFilter: homeHistoryCubit.state.filter,
    );

    if (mounted && filter is ExerciseFilter) {
      homeHistoryCubit.updateFilter(filter);
      homeHistoryCubit.getAllPRs();
    }
  }
}
