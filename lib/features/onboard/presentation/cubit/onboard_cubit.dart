import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../auth/domain/entities/user.dart';
import '../../../workout/domain/enums/activity_level.dart';
import 'onboard_state.dart';

@injectable
class OnboardCubit extends Cubit<OnboardState> {
  OnboardCubit() : super(const OnboardState());

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

  void reset() {
    if (isClosed) return;
    emit(const OnboardState());
  }
}
