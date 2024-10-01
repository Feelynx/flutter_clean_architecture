import 'package:flutter_clean_architecture/data/datasources/remote/auth/auth_remote_data_source.dart';
import 'package:flutter_clean_architecture/core/network/response.dart';
import 'package:flutter_clean_architecture/domain/entities/user_session_request_entity.dart';
import 'package:flutter_clean_architecture/domain/entities/user_session_response_entity.dart';
import 'package:flutter_clean_architecture/domain/entities/refresh_user_session_request_entity.dart';
import 'package:flutter_clean_architecture/domain/entities/refresh_user_session_response_entity.dart';
import 'package:flutter_clean_architecture/domain/entities/user/user_entity.dart';
import 'package:flutter_clean_architecture/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl({required AuthRemoteDataSource authRemoteDataSource})
      : _authRemoteDataSource = authRemoteDataSource;

  @override
  Future<ResponseWrapper<UserSessionResponseEntity>> getUserSession(UserSessionRequestEntity authRequestEntity) {
    return execute(() async {
      final response = await _authRemoteDataSource.getUserSession(authRequestEntity.toDTO());
      return response.toEntity();
    });
  }

  @override
  Future<ResponseWrapper<RefreshUserSessionResponseEntity>> refreshUserSession(
    RefreshUserSessionRequestEntity refreshTokenRequestEntity,
  ) {
    return execute(() async {
      final response = await _authRemoteDataSource.refreshUserSession(
        refreshTokenRequestEntity.toDTO(),
      );
      return response.toEntity();
    });
  }

  @override
  Future<ResponseWrapper<UserEntity>> getUser() {
    return execute(() async {
      final response = await _authRemoteDataSource.getUser();
      return response.toEntity();
    });
  }
}
