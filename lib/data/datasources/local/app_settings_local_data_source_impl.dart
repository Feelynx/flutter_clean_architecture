import 'package:flutter_clean_architecture/core/service/shared_preferences_service.dart';
import 'package:flutter_clean_architecture/data/datasources/local/app_settings_local_data_source.dart';
import 'package:flutter_clean_architecture/data/dto/app_settings_dto.dart';

class AppSettingsLocalDataSourceImpl implements AppSettingsLocalDataSource {
  static const appSettingsKey = 'app_settings';
  final SharedPreferenceService sharedPreferenceService;

  AppSettingsLocalDataSourceImpl({required this.sharedPreferenceService});

  @override
  Future<AppSettingsDTO> getAppSettings() async {
    final appSettingsConfig = await sharedPreferenceService.getJSON(appSettingsKey);
    return appSettingsConfig.isEmpty ? AppSettingsDTO.initial() : AppSettingsDTO.fromJson(appSettingsConfig);
  }

  @override
  Future<void> setAppSettings(AppSettingsDTO appSettings) async {
    await sharedPreferenceService.saveJSON(appSettingsKey, appSettings.toJson());
  }
}
