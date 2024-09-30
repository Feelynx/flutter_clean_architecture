import 'package:flutter/material.dart';

abstract class AppSettingsLocalRepository {
  Future<void> setThemeMode(int themeModeIndex);
  Future<ThemeMode> getThemeMode();
}
