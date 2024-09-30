import 'package:flutter_clean_architecture/data/datasources/remote/auth/auth_remote_data_source.dart';
import 'package:flutter_clean_architecture/core/network/response.dart';
import 'package:flutter_clean_architecture/domain/entities/login_request_entity.dart';
import 'package:flutter_clean_architecture/domain/entities/login_response_entity.dart';
import 'package:flutter_clean_architecture/domain/entities/refresh_token_request_entity.dart';
import 'package:flutter_clean_architecture/domain/entities/refresh_token_response_entity.dart';
import 'package:flutter_clean_architecture/domain/entities/user/user_entity.dart';
import 'package:flutter_clean_architecture/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl({required AuthRemoteDataSource authRemoteDataSource})
      : _authRemoteDataSource = authRemoteDataSource;

  @override
  Future<ResponseWrapper<LoginResponseEntity>> getToken(LoginRequestEntity authRequestEntity) {
    return execute(() async {
      final response = await _authRemoteDataSource.getToken(authRequestEntity.toDTO());
      return response.toEntity();
    });
  }

  @override
  Future<ResponseWrapper<RefreshTokenResponseEntity>> refreshToken(
    RefreshTokenRequestEntity refreshTokenRequestEntity,
  ) {
    return execute(() async {
      final response = await _authRemoteDataSource.refreshToken(
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
