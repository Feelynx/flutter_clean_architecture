import 'package:flutter_clean_architecture/data/datasources/remote/auth/auth_api_client.dart';
import 'package:flutter_clean_architecture/data/datasources/remote/auth/auth_remote_data_source.dart';
import 'package:flutter_clean_architecture/data/dto/login_request_dto.dart';
import 'package:flutter_clean_architecture/data/dto/login_response_dto.dart';
import 'package:flutter_clean_architecture/data/dto/refresh_token_request_dto.dart';
import 'package:flutter_clean_architecture/data/dto/refresh_token_response_dto.dart';
import 'package:flutter_clean_architecture/data/dto/user/user_dto.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiClient client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<AuthResponseDTO> getToken(AuthRequestDTO authRequestModel) {
    return client.login(authRequestModel);
  }

  @override
  Future<RefreshTokenResponseDTO> refreshToken(RefreshTokenRequestDTO refreshTokenRequestModel) {
    return client.refreshToken(refreshTokenRequestModel);
  }

  @override
  Future<UserDTO> getUser() {
    return client.getUser();
  }
}
