import 'package:flutter_clean_architecture/data/dto/user_session_request_dto.dart';
import 'package:flutter_clean_architecture/domain/entities/base_entity.dart';

class UserSessionRequestEntity extends BaseEntity<UserSessionRequestDTO> {
  final String username;
  final String password;
  final int? expiresInMins;

  const UserSessionRequestEntity({
    required this.username,
    required this.password,
    this.expiresInMins,
  });

  @override
  List<Object?> get props => [username, password, expiresInMins];

  @override
  UserSessionRequestDTO toDTO() {
    return UserSessionRequestDTO(
      username: username,
      password: password,
      expiresInMins: expiresInMins,
    );
  }
}
