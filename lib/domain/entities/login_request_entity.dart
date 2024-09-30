import 'package:flutter_clean_architecture/data/dto/login_request_dto.dart';
import 'package:flutter_clean_architecture/domain/entities/base_entity.dart';

class LoginRequestEntity extends BaseEntity<AuthRequestDTO> {
  final String username;
  final String password;
  final int? expiresInMins;

  const LoginRequestEntity({
    required this.username,
    required this.password,
    this.expiresInMins,
  });

  @override
  List<Object?> get props => [username, password, expiresInMins];

  @override
  AuthRequestDTO toDTO() {
    return AuthRequestDTO(
      username: username,
      password: password,
      expiresInMins: expiresInMins,
    );
  }
}
