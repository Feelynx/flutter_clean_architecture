import 'package:flutter_clean_architecture/core/network/response.dart';
import 'package:flutter_clean_architecture/domain/entities/user_session_request_entity.dart';
import 'package:flutter_clean_architecture/domain/entities/user_session_response_entity.dart';
import 'package:flutter_clean_architecture/domain/entities/refresh_user_session_request_entity.dart';
import 'package:flutter_clean_architecture/domain/entities/refresh_user_session_response_entity.dart';
import 'package:flutter_clean_architecture/domain/entities/user/user_entity.dart';

abstract class AuthRepository {
  Future<ResponseWrapper<UserSessionResponseEntity>> getUserSession(
    UserSessionRequestEntity authRequestEntity,
  );
  Future<ResponseWrapper<RefreshUserSessionResponseEntity>> refreshUserSession(
    RefreshUserSessionRequestEntity refreshTokenRequestEntity,
  );
  Future<ResponseWrapper<UserEntity>> getUser();
}
