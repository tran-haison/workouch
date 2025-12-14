import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/app_constants.dart';

part 'openai_service.g.dart';

@RestApi()
@LazySingleton()
abstract class OpenAIService {
  @factoryMethod
  factory OpenAIService(@Named(AppConstants.openai) Dio dio) = _OpenAIService;

  @POST('/responses')
  Future<HttpResponse<Map<String, dynamic>>> generateWorkout(
    @Body() Map<String, dynamic> request,
  );
}
