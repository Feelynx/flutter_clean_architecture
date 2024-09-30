import 'package:flutter_clean_architecture/core/network/response.dart';
import 'package:flutter_clean_architecture/domain/entities/login_request_entity.dart';
import 'package:flutter_clean_architecture/domain/entities/login_response_entity.dart';
import 'package:flutter_clean_architecture/domain/entities/refresh_token_request_entity.dart';
import 'package:flutter_clean_architecture/domain/entities/refresh_token_response_entity.dart';
import 'package:flutter_clean_architecture/domain/entities/user/user_entity.dart';

abstract class AuthRepository {
  Future<ResponseWrapper<LoginResponseEntity>> getToken(
    LoginRequestEntity authRequestEntity,
  );
  Future<ResponseWrapper<RefreshTokenResponseEntity>> refreshToken(
    RefreshTokenRequestEntity refreshTokenRequestEntity,
  );
  Future<ResponseWrapper<UserEntity>> getUser();
}
