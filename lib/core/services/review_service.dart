import 'dart:io';
import 'package:in_app_review/in_app_review.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/app_constants.dart';
import '../utils/log.dart';
import 'storage_service.dart';

@lazySingleton
class ReviewService {
  ReviewService(this._storageService);

  static const _minDaysBetweenReviews = 30; // Minimum days between review
  static const _maxReviewPrompts = 3; // Maximum times to show review dialog

  final InAppReview _inAppReview = InAppReview.instance;
  final StorageService _storageService;

  /// Check if we should show the review dialog
  Future<bool> shouldShowReviewDialog() async {
    try {
      // Check if user has chosen to never show again
      final neverShowAgain = _storageService.getNeverShowAgain();
      if (neverShowAgain) {
        return false;
      }

      // Check review count
      final reviewCount = _storageService.getReviewCount();
      if (reviewCount >= _maxReviewPrompts) {
        return false;
      }

      // Check if enough time has passed since last review
      final lastReviewDate = _storageService.getLastReviewDate();
      if (lastReviewDate != null) {
        final daysSinceLastReview = DateTime.now()
            .difference(lastReviewDate)
            .inDays;
        if (daysSinceLastReview < _minDaysBetweenReviews) {
          return false;
        }
      }

      // Check if in-app review is available for device
      final isAvailable = await _inAppReview.isAvailable();
      if (!isAvailable) {
        return false;
      }

      return true;
    } catch (e) {
      Log.e('Error checking should show review dialog: $e');
      return false;
    }
  }

  /// Show the in-app review dialog
  Future<bool> showInAppReview() async {
    try {
      final isAvailable = await _inAppReview.isAvailable();
      if (!isAvailable) {
        return false;
      }

      await _inAppReview.requestReview();

      // Increment review count and update last review date
      await _storageService.incrementReviewCount();
      await _storageService.setLastReviewDate(DateTime.now());

      return true;
    } catch (e) {
      Log.e('Error showing in-app review: $e');
      return false;
    }
  }

  /// Open app store for review
  Future<void> openStoreForReview() async {
    try {
      final url = Platform.isAndroid
          ? AppConstants.url.playStore
          : AppConstants.url.appStore;

      final uri = Uri.parse(url);
      final canLaunch = await canLaunchUrl(uri);
      if (canLaunch) {
        await launchUrl(uri);
      }
    } catch (e) {
      Log.e('Error opening store for review: $e');
    }
  }
}
