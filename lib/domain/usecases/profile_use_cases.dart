import 'package:flutter_clean_architecture/core/network/response.dart';
import 'package:flutter_clean_architecture/domain/domain_exports.dart';

class ProfileUseCases {
  final AuthRepository authRepository;

  const ProfileUseCases(this.authRepository);

  Future<ResponseWrapper<UserEntity>> getUser() {
    return authRepository.getUser();
  }
}
