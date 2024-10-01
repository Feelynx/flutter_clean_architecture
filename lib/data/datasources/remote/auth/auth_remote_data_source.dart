import 'package:flutter_clean_architecture/data/dto/user_session_request_dto.dart';
import 'package:flutter_clean_architecture/data/dto/user_session_response_dto.dart';
import 'package:flutter_clean_architecture/data/dto/refresh_user_session_request_dto.dart';
import 'package:flutter_clean_architecture/data/dto/refresh_user_session_response_dto.dart';
import 'package:flutter_clean_architecture/data/dto/user/user_dto.dart';

abstract class AuthRemoteDataSource {
  Future<UserSessionResponseDTO> getUserSession(UserSessionRequestDTO authRequestModel);
  Future<RefreshUserSessionResponseDTO> refreshUserSession(RefreshUserSessionRequestDTO refreshTokenRequestModel);
  Future<UserDTO> getUser();
}
