import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Log {
  Log._();

  static final _logger = Logger(
    printer: PrettyPrinter(),
    filter: null,
    output: null,
  );

  static void d(String msg) {
    if (!kReleaseMode) {
      _logger.d(msg);
    }
  }

  static void i(String msg) {
    if (!kReleaseMode) {
      _logger.i(msg);
    }
  }

  static void w(String msg) {
    if (!kReleaseMode) {
      _logger.w(msg);
    }
  }

  static void e(String msg) {
    if (!kReleaseMode) {
      _logger.e(msg);
    }
  }
}
