import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  if (e is FunctionException) {
    final details = e.details;
    final message = details is Map ? details['message']?.toString() : null;
    return Error(
      message: message ?? e.reasonPhrase ?? AppConstants.commonError,
      code: e.status.toString(),
      errorType: e.status == 0 ? ErrorType.network : ErrorType.server,
    );
  }

  if (e is SocketException) {
    return Error(
      message: AppConstants.networkError,
      errorType: ErrorType.network,
    );
  }
  return Error(message: AppConstants.commonError, errorType: ErrorType.other);
}
