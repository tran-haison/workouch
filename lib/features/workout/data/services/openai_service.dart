import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/app_constants.dart';
import '../models/requests/openai_request.dart';
import '../models/dtos/openai_dto.dart';

part 'openai_service.g.dart';

@RestApi()
@LazySingleton()
abstract class OpenAIService {
  @factoryMethod
  factory OpenAIService(@Named(AppConstants.openai) Dio dio) = _OpenAIService;

  @POST('/responses')
  Future<HttpResponse<OpenAIDto>> generateWorkout(
    @Body() OpenAIRequest request,
  );
}
