import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/service/shared_preferences_service.dart';
import 'package:flutter_clean_architecture/data/datasources/local/app_settings_local_data_source.dart';

class AppSettingsLocalDataSourceImpl implements AppSettingsLocalDataSource {
  static const themeKey = 'theme_mode';
  final SharedPreferenceService sharedPreferenceService;

  AppSettingsLocalDataSourceImpl({required this.sharedPreferenceService});

  @override
  Future<ThemeMode> getThemeMode() async {
    final themeModeIndex = await sharedPreferenceService.getValue<int>(themeKey) ?? 0;
    return ThemeMode.values[themeModeIndex];
  }

  @override
  Future<void> setThemeMode(int themeModeIndex) {
    return sharedPreferenceService.setValue(themeKey, themeModeIndex);
  }
}
