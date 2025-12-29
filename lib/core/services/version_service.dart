import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:injectable/injectable.dart';

import '../constants/app_constants.dart';
import '../utils/log.dart';

@lazySingleton
class VersionService {
  String? _version;
  String? _buildNumber;

  Future<String> getVersion() async {
    if (_version != null) return _version!;

    try {
      final packageInfo = await PackageInfo.fromPlatform();
      _version = packageInfo.version;
      _buildNumber = packageInfo.buildNumber;
      return _version!;
    } catch (e) {
      Log.e('Error getting app version: $e');
      return '1.0.0'; // Fallback version
    }
  }

  Future<String> getFullVersion() async {
    if (_version != null && _buildNumber != null) {
      return '$_version+$_buildNumber';
    }

    try {
      final packageInfo = await PackageInfo.fromPlatform();
      _version = packageInfo.version;
      _buildNumber = packageInfo.buildNumber;
      return '$_version+$_buildNumber';
    } catch (e) {
      Log.e('Error getting full app version: $e');
      return '1.0.0+1'; // Fallback version
    }
  }

  Future<String> getAppName() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      return packageInfo.appName;
    } catch (e) {
      Log.e('Error getting app name: $e');
      return AppConstants.appName; // Fallback name
    }
  }

  Future<String> getDeviceId() async {
    try {
      final deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        return androidInfo.id;
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor ?? 'unknown';
      } else {
        return 'unsupported_platform';
      }
    } catch (e) {
      Log.e('Error getting device id: $e');
      return 'unknown';
    }
  }
}
