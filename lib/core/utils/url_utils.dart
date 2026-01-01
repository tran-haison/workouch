import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/app_constants.dart';
import '../widgets/common_toast.dart';

class UrlUtils {
  const UrlUtils._();

  /// Opens a URL in an external application
  /// On Android 11+, canLaunchUrl might return false even with proper queries,
  /// so we try to launch directly and handle exceptions.
  /// Shows an error toast if the URL cannot be opened.
  static Future<void> openUrl(
    BuildContext context,
    String urlString, {
    LaunchMode mode = LaunchMode.externalApplication,
  }) async {
    try {
      final url = Uri.parse(urlString);
      await launchUrl(url, mode: mode);
    } catch (e) {
      if (context.mounted) {
        showCommonToast(AppConstants.commonError, isError: true);
      }
    }
  }
}
