import 'package:flutter/material.dart';

abstract class AppSettingsLocalDataSource {
  Future<void> setThemeMode(int themeModeIndex);
  Future<ThemeMode> getThemeMode();
}
