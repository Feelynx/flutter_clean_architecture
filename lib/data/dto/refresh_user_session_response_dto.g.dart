// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_user_session_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshUserSessionResponseDTO _$RefreshUserSessionResponseDTOFromJson(
        Map<String, dynamic> json) =>
    RefreshUserSessionResponseDTO(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$RefreshUserSessionResponseDTOToJson(
        RefreshUserSessionResponseDTO instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
