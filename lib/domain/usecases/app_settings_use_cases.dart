import 'package:flutter_clean_architecture/domain/entities/app_settings_entity.dart';
import 'package:flutter_clean_architecture/domain/repositories/app_settings_local_repository.dart';

class AppSettingsUseCases {
  final AppSettingsLocalRepository appSettingsLocalRepository;

  const AppSettingsUseCases(this.appSettingsLocalRepository);

  Future<void> setAppSettings(AppSettingsEntity appSettings) {
    return appSettingsLocalRepository.setAppSettings(appSettings);
  }

  Future<AppSettingsEntity> getAppSettings() async => await appSettingsLocalRepository.getAppSettings();
}
