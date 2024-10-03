import 'package:flutter_clean_architecture/data/dto/app_settings_dto.dart';

abstract class AppSettingsLocalDataSource {
  Future<void> setAppSettings(AppSettingsDTO appSettings);
  Future<AppSettingsDTO> getAppSettings();
}
