import 'package:flutter_clean_architecture/core/network/response.dart';
import 'package:flutter_clean_architecture/domain/entities/user_session_response_entity.dart';

abstract class AuthLocalRepository {
  Future<void> setLocalUserSession(UserSessionResponseEntity auth);
  Future<ResponseWrapper<UserSessionResponseEntity>> getLocalUserSession();
  Future<void> clearLocalSession();
}
