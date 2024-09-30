import 'package:flutter_clean_architecture/core/service/flutter_secure_storage_service.dart';
import 'package:flutter_clean_architecture/data/datasources/local/auth_local_data_source.dart';
import 'package:flutter_clean_architecture/data/dto/login_response_dto.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const authKey = 'auth_token';
  final FlutterSecureStorageService flutterSecureStorageService;

  AuthLocalDataSourceImpl({required this.flutterSecureStorageService});

  @override
  Future<AuthResponseDTO> getLocalAuthToken() async {
    final authToken = await flutterSecureStorageService.getJSON(key: authKey);
    return AuthResponseDTO.fromJson(authToken);
  }

  @override
  Future<void> setLocalAuthToken(AuthResponseDTO auth) {
    return flutterSecureStorageService.saveJSON(key: authKey, map: auth.toJson());
  }

  @override
  Future<void> clearLocalSession() {
    return flutterSecureStorageService.clearAllData();
  }
}
