import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/domain/entities/app_settings_entity.dart';
import 'package:flutter_clean_architecture/domain/usecases/app_settings_use_cases.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this.appSettingsUseCases) : super(ThemeInitial(AppSettingsEntity.initial())) {
    loadAppSettings();
  }

  final AppSettingsUseCases appSettingsUseCases;

  void loadAppSettings() async {
    final appSettings = await appSettingsUseCases.getAppSettings();
    emit(ThemeLoaded(appSettings));
  }

  void changeThemeMode(ThemeMode themeMode) async {
    final currentAppSettings = state.appSettings;
    final newAppSettings = currentAppSettings.copyWith(themeMode: themeMode.index);
    await appSettingsUseCases.setAppSettings(newAppSettings);
    emit(ThemeLoaded(newAppSettings));
  }

  void changeThemeColor(Color color) async {
    final currentAppSettings = state.appSettings;
    final newAppSettings = currentAppSettings.copyWith(color: color.value);
    await appSettingsUseCases.setAppSettings(newAppSettings);
    emit(ThemeLoaded(newAppSettings));
  }
}
