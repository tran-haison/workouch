import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/error.dart';
import '../../../auth/domain/entities/user.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../workout/domain/enums/activity_level.dart';
import 'onboard_state.dart';

@injectable
class OnboardCubit extends Cubit<OnboardState> {
  final AuthCubit _authCubit;

  OnboardCubit(this._authCubit) : super(const OnboardState());

  void updateGender(Gender gender) {
    if (isClosed) return;
    emit(state.copyWith(gender: gender));
  }

  void updateAge(int age) {
    if (isClosed) return;
    emit(state.copyWith(age: age));
  }

  void updateHeight(double height) {
    if (isClosed) return;
    emit(state.copyWith(height: height));
  }

  void updateWeight(double weight) {
    if (isClosed) return;
    emit(state.copyWith(weight: weight));
  }

  void updateActivityLevel(ActivityLevel activityLevel) {
    if (isClosed) return;
    emit(state.copyWith(activityLevel: activityLevel));
  }

  void nextPage() {
    if (isClosed) return;
    emit(state.copyWith(currentPage: state.currentPage + 1));
  }

  void previousPage() {
    if (isClosed) return;
    if (state.currentPage > 0) {
      emit(state.copyWith(currentPage: state.currentPage - 1));
    }
  }

  void goToPage(int page) {
    if (isClosed) return;
    emit(state.copyWith(currentPage: page));
  }

  Future<void> completeOnboarding() async {
    if (isClosed) return;

    final gender = state.gender;
    final age = state.age;
    final height = state.height;
    final weight = state.weight;
    final activityLevel = state.activityLevel;

    if (gender == null ||
        age == null ||
        height == null ||
        weight == null ||
        activityLevel == null) {
      emit(
        state.copyWith(
          status: OnboardStateStatus.error,
          error: Error(
            message: AppConstants.pleaseFillInAllRequiredInformation,
            errorType: ErrorType.other,
          ),
        ),
      );
      return;
    }

    if (age <= 0 || height <= 0 || weight <= 0) {
      emit(
        state.copyWith(
          status: OnboardStateStatus.error,
          error: Error(
            message: AppConstants.pleaseEnterValidValues,
            errorType: ErrorType.other,
          ),
        ),
      );
      return;
    }

    emit(state.copyWith(status: OnboardStateStatus.loading));

    // TODO: remove cubit inside cubit, need to use repository instead
    _authCubit.updateUserProfile(
      age: age,
      gender: gender,
      height: height,
      weight: weight,
      activityLevel: activityLevel,
    );

    emit(state.copyWith(status: OnboardStateStatus.success));
  }

  void reset() {
    if (isClosed) return;
    emit(const OnboardState());
  }
}
