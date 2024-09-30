// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenRequestDTO _$RefreshTokenRequestDTOFromJson(
        Map<String, dynamic> json) =>
    RefreshTokenRequestDTO(
      refreshToken: json['refreshToken'] as String,
      expiresInMins: (json['expiresInMins'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RefreshTokenRequestDTOToJson(
        RefreshTokenRequestDTO instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
      'expiresInMins': instance.expiresInMins,
    };
