import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/version_service.dart';
import 'settings_state.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._versionService) : super(const SettingsState()) {
    _loadVersionInfo();
  }

  final VersionService _versionService;

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
