import 'package:flutter_clean_architecture/data/dto/login_response_dto.dart';

abstract class AuthLocalDataSource {
  Future<void> setLocalAuthToken(AuthResponseDTO auth);
  Future<AuthResponseDTO> getLocalAuthToken();
  Future<void> clearLocalSession();
}
