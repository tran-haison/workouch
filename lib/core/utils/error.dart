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
  if (e is DioException) {
    // Handle different DioException types
    if (e.error is SocketException) {
      return Error(
        message: AppConstants.networkError,
        errorType: ErrorType.network,
      );
    }

    // Handle timeout errors
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return Error(
        message: 'Request timeout. Please check your connection and try again.',
        errorType: ErrorType.network,
      );
    }

    // Handle connection errors
    if (e.type == DioExceptionType.connectionError) {
      return Error(
        message: AppConstants.networkError,
        errorType: ErrorType.network,
      );
    }

    // Handle server errors (4xx, 5xx)
    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      if (statusCode != null && statusCode >= 400) {
        return Error(
          message:
              e.response?.data?['message']?.toString() ??
              e.response?.statusMessage ??
              AppConstants.commonError,
          code: statusCode.toString(),
          errorType: ErrorType.server,
        );
      }
    }

    // Other DioException types
    return Error(
      message: e.message?.toString() ?? AppConstants.networkError,
      errorType: ErrorType.network,
    );
  }

  return Error(message: AppConstants.commonError, errorType: ErrorType.other);
}
