import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/data/dto/app_settings_dto.dart';
import 'package:flutter_clean_architecture/domain/domain_exports.dart';

class AppSettingsEntity extends BaseEntity<AppSettingsDTO> {
  final int themeMode;
  final int color;

  const AppSettingsEntity({
    required this.themeMode,
    required this.color,
  });

  factory AppSettingsEntity.initial() {
    return AppSettingsEntity(
      themeMode: ThemeMode.system.index,
      color: Colors.blueAccent.value,
    );
  }

  AppSettingsEntity copyWith({
    int? themeMode,
    int? color,
  }) {
    return AppSettingsEntity(
      themeMode: themeMode ?? this.themeMode,
      color: color ?? this.color,
    );
  }

  ThemeMode get themeModeEnum => ThemeMode.values[themeMode];
  Color get colorEnum => Color(color);

  @override
  List<Object?> get props => [
        themeMode,
        color,
      ];

  @override
  AppSettingsDTO toDTO() {
    return AppSettingsDTO(
      themeMode: themeMode,
      color: color,
    );
  }
}
