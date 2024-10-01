import 'package:flutter_clean_architecture/core/network/response.dart';
import 'package:flutter_clean_architecture/domain/entities/user_session_response_entity.dart';
import 'package:flutter_clean_architecture/domain/repositories/auth_local_repository.dart';

class HomeUseCases {
  final AuthLocalRepository _authLocalRepository;

  const HomeUseCases(this._authLocalRepository);

  Future<ResponseWrapper<UserSessionResponseEntity>> getLocalUserSession() {
    return _authLocalRepository.getLocalUserSession();
  }
}
