import 'package:bloc/bloc.dart';
import 'package:flutter_clean_architecture/core/di/shared_export.dart';
import 'package:flutter_clean_architecture/domain/domain_exports.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authUseCases) : super(LoginInitial());

  final AuthUseCases authUseCases;

  void login(LoginRequestEntity request) async {
    emit(LoginLoading());
    final result = await authUseCases.getToken(request);
    result.when(
      (data) async {
        authNotifier.doLogin(data);
      },
      (error) {
        emit(LoginError(error.toString()));
        authNotifier.doLogout();
      },
    );
  }
}
