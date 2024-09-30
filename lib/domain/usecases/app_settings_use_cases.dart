import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/domain/repositories/app_settings_local_repository.dart';

class AppSettingsUseCases {
  final AppSettingsLocalRepository appSettingsLocalRepository;

  const AppSettingsUseCases(this.appSettingsLocalRepository);

  Future<void> setThemeMode(int themeModeIndex) {
    return appSettingsLocalRepository.setThemeMode(themeModeIndex);
  }

  Future<ThemeMode> getThemeMode() {
    return appSettingsLocalRepository.getThemeMode();
  }
}
