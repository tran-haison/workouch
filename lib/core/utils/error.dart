import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../constants/app_constants.dart';

part 'error.freezed.dart';

@freezed
abstract class Error with _$Error {
  const factory Error({
    required String message,
    String? code,
    ErrorType? errorType,
  }) = _Error;
}

enum ErrorType { network, server, cache, other }

Error handleException(dynamic e) {
  if (e is DioException && e.error is SocketException) {
    return Error(
      message: AppConstants.networkError,
      errorType: ErrorType.network,
    );
  }
  return Error(message: AppConstants.commonError, errorType: ErrorType.other);
}
