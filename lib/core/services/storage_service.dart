import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

import '../utils/log.dart';

enum PrefsKey { reviewCount, lastReviewDate, neverShowAgain }

@lazySingleton
class StorageService {
  StorageService(this._appPrefs);

  final AppPrefs _appPrefs;

  /// Get never show again flag
  bool getNeverShowAgain() {
    return _appPrefs.read<bool>(PrefsKey.neverShowAgain) ?? false;
  }

  /// Set never show again flag
  Future<void> setNeverShowAgain() async {
    await _appPrefs.save(PrefsKey.neverShowAgain, true);
  }

  /// Get the current review count
  int getReviewCount() {
    return _appPrefs.read<int>(PrefsKey.reviewCount) ?? 0;
  }

  /// Increment the review count
  Future<void> incrementReviewCount() async {
    final currentCount = getReviewCount();
    await _appPrefs.save(PrefsKey.reviewCount, currentCount + 1);
  }

  /// Get the last review date
  DateTime? getLastReviewDate() {
    final timestamp = _appPrefs.read<int>(PrefsKey.lastReviewDate);
    return timestamp != null
        ? DateTime.fromMillisecondsSinceEpoch(timestamp)
        : null;
  }

  /// Set the last review date
  Future<void> setLastReviewDate(DateTime date) async {
    await _appPrefs.save(PrefsKey.lastReviewDate, date.millisecondsSinceEpoch);
  }
}

@lazySingleton
class AppPrefs {
  AppPrefs(this._sharedPrefs);

  final SharedPreferences _sharedPrefs;

  // Generic save method
  Future<bool> save<T>(PrefsKey key, T value) async {
    try {
      if (value is int) {
        return await _sharedPrefs.setInt(key.name, value);
      }
      if (value is double) {
        return await _sharedPrefs.setDouble(key.name, value);
      }
      if (value is String) {
        return await _sharedPrefs.setString(key.name, value);
      }
      if (value is bool) {
        return await _sharedPrefs.setBool(key.name, value);
      }
      if (value is List<String>) {
        return await _sharedPrefs.setStringList(key.name, value);
      }

      return false;
    } catch (e) {
      Log.e('Error saving to SharedPreferences: $e');
      return false;
    }
  }

  // Generic read method
  T? read<T>(PrefsKey key) {
    try {
      final value = _sharedPrefs.get(key.name);
      return value as T?;
    } catch (e) {
      Log.e('Error reading from SharedPreferences: $e');
      return null;
    }
  }

  // Delete specific key
  Future<bool> delete(PrefsKey key) async {
    try {
      return await _sharedPrefs.remove(key.name);
    } catch (e) {
      Log.e('Error deleting from SharedPreferences: $e');
      return false;
    }
  }

  // Clear all data
  Future<bool> clear() async {
    try {
      return await _sharedPrefs.clear();
    } catch (e) {
      Log.e('Error clearing SharedPreferences: $e');
      return false;
    }
  }
}
