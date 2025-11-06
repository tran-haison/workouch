import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/app_constants.dart';
import '../models/dtos/api_response_dto.dart';
import '../models/dtos/exercise_dto.dart';
import '../models/requests/exercise_filter_request.dart';
import '../models/requests/paging_request.dart';

part 'exercise_service.g.dart';

@RestApi()
@LazySingleton()
abstract class ExerciseService {
  @factoryMethod
  factory ExerciseService(@Named(AppConstants.exerciseDb) Dio dio) =
      _ExerciseService;

  @GET('/exercises/filter')
  Future<HttpResponse<ApiResponseDto<ExerciseDto>>> getExercises({
    @Queries() PagingRequest? paging,
    @Queries() ExerciseFilterRequest? filter,
  });

  @GET('/bodyparts')
  Future<HttpResponse<ApiResponseDto<Map<String, dynamic>>>> getBodyParts();

  @GET('/equipments')
  Future<HttpResponse<ApiResponseDto<Map<String, dynamic>>>> getEquipments();
}
