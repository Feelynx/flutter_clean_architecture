import 'package:flutter_clean_architecture/core/network/response.dart';
import 'package:flutter_clean_architecture/data/datasources/local/auth_local_data_source.dart';
import 'package:flutter_clean_architecture/domain/entities/user_session_response_entity.dart';
import 'package:flutter_clean_architecture/domain/repositories/auth_local_repository.dart';

class AuthLocalRepositoryImpl implements AuthLocalRepository {
  final AuthLocalDataSource _authLocalDataSource;

  AuthLocalRepositoryImpl({required AuthLocalDataSource authLocalDataSource})
      : _authLocalDataSource = authLocalDataSource;

  @override
  Future<ResponseWrapper<UserSessionResponseEntity>> getLocalUserSession() {
    return execute(() async {
      final response = await _authLocalDataSource.getLocalUserSession();
      return response.toEntity();
    });
  }

  @override
  Future<void> setLocalUserSession(UserSessionResponseEntity auth) {
    return execute(() async {
      final authDTO = auth.toDTO();
      await _authLocalDataSource.setLocalUserSession(authDTO);
    });
  }

  @override
  Future<void> clearLocalSession() async {
    await _authLocalDataSource.clearLocalSession();
  }
}
