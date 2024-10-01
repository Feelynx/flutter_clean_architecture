import 'package:flutter_clean_architecture/data/dto/user_session_response_dto.dart';

abstract class AuthLocalDataSource {
  Future<void> setLocalUserSession(UserSessionResponseDTO auth);
  Future<UserSessionResponseDTO> getLocalUserSession();
  Future<void> clearLocalSession();
}
