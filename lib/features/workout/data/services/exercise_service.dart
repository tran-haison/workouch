import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/dtos/api_response_dto.dart';
import '../models/dtos/exercise_dto.dart';
import '../models/dtos/generate_workout_dto.dart';
import '../models/dtos/name_item_dto.dart';
import '../models/requests/exercise_filter_request.dart';
import '../models/requests/paging_request.dart';

/// Authenticated gateway to the server-side exercise API proxy.
///
/// The upstream API key deliberately lives only in Supabase Edge Function
/// secrets and is never bundled into the mobile application.
@lazySingleton
class ExerciseService {
  ExerciseService();

  SupabaseClient get _supabase => Supabase.instance.client;

  Future<ApiResponseDto<ExerciseDto>> getExercises({
    PagingRequest? paging,
    ExerciseFilterRequest? filter,
  }) async {
    final json = await _invoke(
      'exercises',
      query: {...?paging?.toJson(), ...?filter?.toJson()},
    );
    return ApiResponseDto.fromJson(json, (value) {
      return ExerciseDto.fromJson(value! as Map<String, dynamic>);
    });
  }

  Future<ApiResponseDto<NameItemDto>> getBodyParts() async {
    final json = await _invoke('bodyparts');
    return ApiResponseDto.fromJson(json, (value) {
      return NameItemDto.fromJson(value! as Map<String, dynamic>);
    });
  }

  Future<ApiResponseDto<NameItemDto>> getEquipments() async {
    final json = await _invoke('equipments');
    return ApiResponseDto.fromJson(json, (value) {
      return NameItemDto.fromJson(value! as Map<String, dynamic>);
    });
  }

  Future<ApiSingleResponseDto<GenerateWorkoutDto>> generateWorkout(
    Map<String, dynamic> request,
  ) async {
    final json = await _invoke('generateWorkout', body: request);
    return ApiSingleResponseDto.fromJson(json, (value) {
      return GenerateWorkoutDto.fromJson(value! as Map<String, dynamic>);
    });
  }

  Future<Map<String, dynamic>> _invoke(
    String action, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) async {
    final response = await _supabase.functions.invoke(
      'exercise-api',
      body: {
        'action': action,
        if (query != null)
          'query': Map.fromEntries(
            query.entries.where((entry) => entry.value != null),
          ),
        if (body != null) 'body': body,
      },
    );
    return (response.data as Map).cast<String, dynamic>();
  }
}
