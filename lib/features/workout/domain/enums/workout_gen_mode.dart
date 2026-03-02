import '../../../../core/constants/app_constants.dart';

enum WorkoutGenMode { shuffle, neat }

extension WorkoutGenModeExt on WorkoutGenMode {
  String get label => switch (this) {
    WorkoutGenMode.shuffle => AppConstants.theShuffleMode,
    WorkoutGenMode.neat => AppConstants.theNeatMode,
  };

  bool get isShuffle => this == WorkoutGenMode.shuffle;

  bool get isNeat => this == WorkoutGenMode.neat;
}
