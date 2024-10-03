// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSettingsDTO _$AppSettingsDTOFromJson(Map<String, dynamic> json) =>
    AppSettingsDTO(
      themeMode: (json['themeMode'] as num).toInt(),
      color: (json['color'] as num).toInt(),
    );

Map<String, dynamic> _$AppSettingsDTOToJson(AppSettingsDTO instance) =>
    <String, dynamic>{
      'themeMode': instance.themeMode,
      'color': instance.color,
    };
