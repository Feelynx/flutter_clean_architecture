import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/data/dto/login_request_dto.dart';
import 'package:flutter_clean_architecture/data/dto/login_response_dto.dart';
import 'package:flutter_clean_architecture/data/dto/refresh_token_request_dto.dart';
import 'package:flutter_clean_architecture/data/dto/refresh_token_response_dto.dart';
import 'package:flutter_clean_architecture/data/dto/user/user_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_client.g.dart';

@RestApi()
abstract class AuthApiClient {
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST('/auth/login')
  Future<AuthResponseDTO> login(
    @Body() AuthRequestDTO authRequestModel,
  );

  @POST('/auth/refresh')
  Future<RefreshTokenResponseDTO> refreshToken(
    @Body() RefreshTokenRequestDTO refreshTokenRequestModel,
  );

  @GET('/auth/me')
  Future<UserDTO> getUser();
}
