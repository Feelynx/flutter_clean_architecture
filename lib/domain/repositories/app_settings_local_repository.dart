import 'package:flutter_clean_architecture/domain/entities/app_settings_entity.dart';

abstract class AppSettingsLocalRepository {
  Future<void> setAppSettings(AppSettingsEntity appSettings);
  Future<AppSettingsEntity> getAppSettings();
}
