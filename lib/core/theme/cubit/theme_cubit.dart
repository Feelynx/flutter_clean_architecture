import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/domain/usecases/app_settings_use_cases.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this.appSettingsUseCases) : super(ThemeMode.system) {
    loadThemeMode();
  }

  final AppSettingsUseCases appSettingsUseCases;

  void loadThemeMode() async {
    final mode = await appSettingsUseCases.getThemeMode();
    emit(mode);
  }

  void changeMode(ThemeMode? mode) async {
    await appSettingsUseCases.setThemeMode(mode?.index ?? ThemeMode.system.index);
    emit(mode ?? ThemeMode.system);
  }
}
