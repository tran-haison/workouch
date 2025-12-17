// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_workout_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NeatModeGenerateWorkoutRequestImpl
_$$NeatModeGenerateWorkoutRequestImplFromJson(Map<String, dynamic> json) =>
    _$NeatModeGenerateWorkoutRequestImpl(
      mode: json['mode'] as String,
      specifications: SpecificationsRequest.fromJson(
        json['specifications'] as Map<String, dynamic>,
      ),
      userContext: json['userContext'] == null
          ? null
          : UserContextRequest.fromJson(
              json['userContext'] as Map<String, dynamic>,
            ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NeatModeGenerateWorkoutRequestImplToJson(
  _$NeatModeGenerateWorkoutRequestImpl instance,
) => <String, dynamic>{
  'mode': instance.mode,
  'specifications': instance.specifications,
  if (instance.userContext case final value?) 'userContext': value,
  'runtimeType': instance.$type,
};

_$ShuffleModeGenerateWorkoutRequestImpl
_$$ShuffleModeGenerateWorkoutRequestImplFromJson(Map<String, dynamic> json) =>
    _$ShuffleModeGenerateWorkoutRequestImpl(
      mode: json['mode'] as String,
      preferences: json['preferences'] as String,
      userContext: json['userContext'] == null
          ? null
          : UserContextRequest.fromJson(
              json['userContext'] as Map<String, dynamic>,
            ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ShuffleModeGenerateWorkoutRequestImplToJson(
  _$ShuffleModeGenerateWorkoutRequestImpl instance,
) => <String, dynamic>{
  'mode': instance.mode,
  'preferences': instance.preferences,
  if (instance.userContext case final value?) 'userContext': value,
  'runtimeType': instance.$type,
};

_$UserContextRequestImpl _$$UserContextRequestImplFromJson(
  Map<String, dynamic> json,
) => _$UserContextRequestImpl(
  age: (json['age'] as num?)?.toInt(),
  height: (json['height'] as num?)?.toDouble(),
  weight: (json['weight'] as num?)?.toDouble(),
  activityLevel: json['activityLevel'] as String?,
  gender: json['gender'] as String?,
);

Map<String, dynamic> _$$UserContextRequestImplToJson(
  _$UserContextRequestImpl instance,
) => <String, dynamic>{
  if (instance.age case final value?) 'age': value,
  if (instance.height case final value?) 'height': value,
  if (instance.weight case final value?) 'weight': value,
  if (instance.activityLevel case final value?) 'activityLevel': value,
  if (instance.gender case final value?) 'gender': value,
};

_$SpecificationsRequestImpl _$$SpecificationsRequestImplFromJson(
  Map<String, dynamic> json,
) => _$SpecificationsRequestImpl(
  workoutName: json['workoutName'] as String?,
  duration: (json['duration'] as num?)?.toInt(),
  intensity: json['intensity'] as String?,
  goals: (json['goals'] as List<dynamic>?)?.map((e) => e as String).toList(),
  bodyParts: (json['bodyParts'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  equipments: (json['equipments'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  location: json['location'] as String?,
  injuries: json['injuries'] as String?,
);

Map<String, dynamic> _$$SpecificationsRequestImplToJson(
  _$SpecificationsRequestImpl instance,
) => <String, dynamic>{
  if (instance.workoutName case final value?) 'workoutName': value,
  if (instance.duration case final value?) 'duration': value,
  if (instance.intensity case final value?) 'intensity': value,
  if (instance.goals case final value?) 'goals': value,
  if (instance.bodyParts case final value?) 'bodyParts': value,
  if (instance.equipments case final value?) 'equipments': value,
  if (instance.location case final value?) 'location': value,
  if (instance.injuries case final value?) 'injuries': value,
};
