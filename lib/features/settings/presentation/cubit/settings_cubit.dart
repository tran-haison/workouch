import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/firebase_service.dart';
import '../../../../core/services/posthog_analytics_service.dart';
import '../../../../core/services/storage_service.dart';
import '../../../../core/services/version_service.dart';
import 'settings_state.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(
    this._versionService,
    this._storageService,
    this._firebaseService,
    this._posthogService,
  ) : super(const SettingsState()) {
    _loadVersionInfo();
    emit(
      state.copyWith(analyticsEnabled: _storageService.getAnalyticsEnabled()),
    );
  }

  final VersionService _versionService;
  final StorageService _storageService;
  final FirebaseService _firebaseService;
  final PostHogAnalyticsService _posthogService;

  Future<void> setAnalyticsEnabled(bool enabled) async {
    await _storageService.setAnalyticsEnabled(enabled);
    await Future.wait([
      _firebaseService.setTelemetryEnabled(enabled),
      _posthogService.setEnabled(enabled),
    ]);
    emit(state.copyWith(analyticsEnabled: enabled));
  }

  Future<void> _loadVersionInfo() async {
    try {
      final version = await _versionService.getVersion();
      final appName = await _versionService.getAppName();

      emit(state.copyWith(appVersion: version, appName: appName));
    } catch (e) {
      // Fallback to default values if version loading fails
      emit(
        state.copyWith(
          appVersion: AppConstants.appVersion,
          appName: AppConstants.appName,
        ),
      );
    }
  }
}
