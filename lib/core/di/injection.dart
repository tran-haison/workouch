import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies() async => $initGetIt(getIt);

@module
@LazySingleton()
abstract class InjectionModule {
  @preResolve
  @LazySingleton()
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @LazySingleton()
  @Named(AppConstants.exerciseDb)
  Dio get dioExerciseDb => _createDio(
    baseUrl: AppConstants.exerciseDbUrl + AppConstants.exerciseDbApiVersion,
    headers: {
      AppConstants.exerciseDbApiKeyHeader:
          dotenv.env[AppConstants.exerciseDbApiKeyEnv] ?? '',
    },
  );

  Dio _createDio({
    required String baseUrl,
    Map<String, dynamic>? headers,
    List<Interceptor>? interceptors,
  }) {
    final BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 30),
      baseUrl: baseUrl,
      responseType: ResponseType.json,
      headers: headers,
      validateStatus: (_) {
        return true;
      },
    );

    final dio = Dio(options);
    if (interceptors != null) {
      dio.interceptors.addAll(interceptors);
    }

    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(requestHeader: true, requestBody: true),
      );
    }

    return dio;
  }
}
