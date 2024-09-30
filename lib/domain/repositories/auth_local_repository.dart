import 'package:flutter_clean_architecture/core/network/response.dart';
import 'package:flutter_clean_architecture/domain/entities/login_response_entity.dart';

abstract class AuthLocalRepository {
  Future<void> setLocalAuthToken(LoginResponseEntity auth);
  Future<ResponseWrapper<LoginResponseEntity>> getLocalAuthToken();
  Future<void> clearLocalSession();
}
