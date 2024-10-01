import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/domain/domain_exports.dart';
import 'package:flutter_clean_architecture/domain/entities/refresh_user_session_request_entity.dart';

class AuthNotifier with ChangeNotifier {
  final AuthUseCases authUseCases;
  var _status = AuthStatus.notAuthenticated;
  UserSessionResponseEntity? _loginResponseEntity;

  AuthNotifier({required this.authUseCases});

  AuthStatus get status => _status;
  UserSessionResponseEntity? get loginResponseEntity => _loginResponseEntity;

  Future<void> doLogin(UserSessionResponseEntity? loginResponseEntity) async {
    if (loginResponseEntity == null) {
      doLogout();
      return;
    }
    if (loginResponseEntity.accessToken == null || loginResponseEntity.refreshToken == null) {
      doLogout();
      return;
    }
    await authUseCases.setLocalAuthToken(loginResponseEntity);
    _loginResponseEntity = loginResponseEntity;
    _status = AuthStatus.authenticated;
    notifyListeners();
  }

  Future<void> checkToken() async {
    final data = await authUseCases.getLocalUserSession();
    data.when(
      (data) {
        if (data.accessToken != null && data.refreshToken != null) {
          _loginResponseEntity = data;
          _status = AuthStatus.authenticated;
          notifyListeners();
        } else {
          doLogout();
        }
      },
      (error) => doLogout(),
    );
  }

  Future<void> refreshAuthToken() async {
    final response = await authUseCases.refreshUserSession(
      RefreshUserSessionRequestEntity(
        refreshToken: loginResponseEntity?.refreshToken ?? '',
      ),
    );
    response.when(
      (data) {
        if (data.accessToken != null && data.refreshToken != null) {
          final newLocalData = loginResponseEntity?.copyWith(
            accessToken: data.accessToken,
            refreshToken: data.refreshToken,
          );
          if (newLocalData != null) {
            authUseCases.setLocalAuthToken(newLocalData);
            _status = AuthStatus.authenticated;
            notifyListeners();
          } else {
            doLogout();
          }
        } else {
          doLogout();
        }
      },
      (error) {
        doLogout();
      },
    );
  }

  Future<void> doLogout() async {
    _status = AuthStatus.notAuthenticated;
    _loginResponseEntity = null;
    await authUseCases.clearLocalSession();
    notifyListeners();
  }
}

enum AuthStatus {
  authenticated,
  notAuthenticated,
}
