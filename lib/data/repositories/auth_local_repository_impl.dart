import 'package:flutter_clean_architecture/core/network/response.dart';
import 'package:flutter_clean_architecture/data/datasources/local/auth_local_data_source.dart';
import 'package:flutter_clean_architecture/domain/entities/login_response_entity.dart';
import 'package:flutter_clean_architecture/domain/repositories/auth_local_repository.dart';

class AuthLocalRepositoryImpl implements AuthLocalRepository {
  final AuthLocalDataSource _authLocalDataSource;

  AuthLocalRepositoryImpl({required AuthLocalDataSource authLocalDataSource})
      : _authLocalDataSource = authLocalDataSource;

  @override
  Future<ResponseWrapper<LoginResponseEntity>> getLocalAuthToken() {
    return execute(() async {
      final response = await _authLocalDataSource.getLocalAuthToken();
      return response.toEntity();
    });
  }

  @override
  Future<void> setLocalAuthToken(LoginResponseEntity auth) {
    return execute(() async {
      final authDTO = auth.toDTO();
      await _authLocalDataSource.setLocalAuthToken(authDTO);
    });
  }

  @override
  Future<void> clearLocalSession() async {
    await _authLocalDataSource.clearLocalSession();
  }
}
