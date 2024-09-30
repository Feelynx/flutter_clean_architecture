import 'package:bloc/bloc.dart';
import 'package:flutter_clean_architecture/core/di/shared_export.dart';
import 'package:flutter_clean_architecture/core/notifier/auth_notifier.dart';
import 'package:flutter_clean_architecture/domain/entities/login_request_entity.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(LoginRequestEntity request) async {
    emit(LoginLoading());
    await authNotifier.doLogin(request);
    if (authNotifier.status == AuthStatus.authenticated) {
      emit(LoginInitial());
    } else {
      emit(LoginError('Errore login'));
    }
  }
}
