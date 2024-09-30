import 'package:flutter_clean_architecture/data/dto/base_dto.dart';
import 'package:flutter_clean_architecture/domain/entities/login_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request_dto.g.dart';

@JsonSerializable(
  createToJson: true,
  explicitToJson: true,
)
class AuthRequestDTO extends BaseDTO<LoginRequestEntity> {
  final String username;
  final String password;
  final int? expiresInMins;

  const AuthRequestDTO({
    required this.username,
    required this.password,
    this.expiresInMins,
  });

  @override
  LoginRequestEntity toEntity() => LoginRequestEntity(
        username: username,
        password: password,
        expiresInMins: expiresInMins,
      );

  @override
  List<Object?> get props => [username, password, expiresInMins];

  Map<String, dynamic> toJson() => _$AuthRequestDTOToJson(this);
}
