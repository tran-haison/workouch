// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_workout_week_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserWorkoutWeekDtoImpl _$$UserWorkoutWeekDtoImplFromJson(
  Map<String, dynamic> json,
) => _$UserWorkoutWeekDtoImpl(
  userId: json['user_id'] as String,
  weekStartDate: json['week_start_date'] as String,
  workoutCount: (json['workout_count'] as num).toInt(),
);

Map<String, dynamic> _$$UserWorkoutWeekDtoImplToJson(
  _$UserWorkoutWeekDtoImpl instance,
) => <String, dynamic>{
  'user_id': instance.userId,
  'week_start_date': instance.weekStartDate,
  'workout_count': instance.workoutCount,
};
