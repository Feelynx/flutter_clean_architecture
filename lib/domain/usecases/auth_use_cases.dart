import 'package:flutter_clean_architecture/core/network/response.dart';
import 'package:flutter_clean_architecture/domain/entities/login_request_entity.dart';
import 'package:flutter_clean_architecture/domain/entities/login_response_entity.dart';
import 'package:flutter_clean_architecture/domain/entities/refresh_token_request_entity.dart';
import 'package:flutter_clean_architecture/domain/entities/refresh_token_response_entity.dart';
import 'package:flutter_clean_architecture/domain/repositories/auth_local_repository.dart';
import 'package:flutter_clean_architecture/domain/repositories/auth_repository.dart';

class AuthUseCases {
  final AuthRepository _authRepository;
  final AuthLocalRepository _authLocalRepository;

  const AuthUseCases(this._authRepository, this._authLocalRepository);

  Future<ResponseWrapper<LoginResponseEntity>> getToken(
    LoginRequestEntity authRequestEntity,
  ) {
    return _authRepository.getToken(authRequestEntity);
  }

  Future<ResponseWrapper<RefreshTokenResponseEntity>> refreshToken(
    RefreshTokenRequestEntity refreshTokenRequestEntity,
  ) {
    return _authRepository.refreshToken(refreshTokenRequestEntity);
  }

  Future<void> setLocalAuthToken(LoginResponseEntity auth) {
    return _authLocalRepository.setLocalAuthToken(auth);
  }

  Future<ResponseWrapper<LoginResponseEntity>> getLocalAuthToken() {
    return _authLocalRepository.getLocalAuthToken();
  }

  Future<void> clearLocalSession() {
    return _authLocalRepository.clearLocalSession();
  }
}
