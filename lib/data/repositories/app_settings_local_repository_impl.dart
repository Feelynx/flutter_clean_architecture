import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/data/datasources/local/app_settings_local_data_source.dart';
import 'package:flutter_clean_architecture/domain/repositories/app_settings_local_repository.dart';

class AppSettingsLocalRepositoryImpl implements AppSettingsLocalRepository {
  final AppSettingsLocalDataSource _appSettingsLocalDataSource;

  AppSettingsLocalRepositoryImpl({required AppSettingsLocalDataSource appSettingsLocalDataSource})
      : _appSettingsLocalDataSource = appSettingsLocalDataSource;

  @override
  Future<ThemeMode> getThemeMode() {
    return _appSettingsLocalDataSource.getThemeMode();
  }

  @override
  Future<void> setThemeMode(int themeModeIndex) {
    return _appSettingsLocalDataSource.setThemeMode(themeModeIndex);
  }
}
