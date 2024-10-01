import 'package:flutter_clean_architecture/data/dto/base_dto.dart';
import 'package:flutter_clean_architecture/domain/entities/user_session_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_session_request_dto.g.dart';

@JsonSerializable(
  createToJson: true,
  explicitToJson: true,
)
class UserSessionRequestDTO extends BaseDTO<UserSessionRequestEntity> {
  final String username;
  final String password;
  final int? expiresInMins;

  const UserSessionRequestDTO({
    required this.username,
    required this.password,
    this.expiresInMins,
  });

  @override
  UserSessionRequestEntity toEntity() => UserSessionRequestEntity(
        username: username,
        password: password,
        expiresInMins: expiresInMins,
      );

  @override
  List<Object?> get props => [username, password, expiresInMins];

  factory UserSessionRequestDTO.fromJson(Map<String, dynamic> json) => _$UserSessionRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserSessionRequestDTOToJson(this);
}
