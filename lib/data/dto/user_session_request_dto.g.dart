// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSessionRequestDTO _$UserSessionRequestDTOFromJson(
        Map<String, dynamic> json) =>
    UserSessionRequestDTO(
      username: json['username'] as String,
      password: json['password'] as String,
      expiresInMins: (json['expiresInMins'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserSessionRequestDTOToJson(
        UserSessionRequestDTO instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'expiresInMins': instance.expiresInMins,
    };
