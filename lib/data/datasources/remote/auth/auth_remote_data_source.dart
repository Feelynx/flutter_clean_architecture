import 'package:flutter_clean_architecture/data/dto/login_request_dto.dart';
import 'package:flutter_clean_architecture/data/dto/login_response_dto.dart';
import 'package:flutter_clean_architecture/data/dto/refresh_token_request_dto.dart';
import 'package:flutter_clean_architecture/data/dto/refresh_token_response_dto.dart';
import 'package:flutter_clean_architecture/data/dto/user/user_dto.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseDTO> getToken(AuthRequestDTO authRequestModel);
  Future<RefreshTokenResponseDTO> refreshToken(RefreshTokenRequestDTO refreshTokenRequestModel);
  Future<UserDTO> getUser();
}
