// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_user_session_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshUserSessionRequestDTO _$RefreshUserSessionRequestDTOFromJson(
        Map<String, dynamic> json) =>
    RefreshUserSessionRequestDTO(
      refreshToken: json['refreshToken'] as String,
      expiresInMins: (json['expiresInMins'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RefreshUserSessionRequestDTOToJson(
        RefreshUserSessionRequestDTO instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
      'expiresInMins': instance.expiresInMins,
    };
