import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/core/di/shared_export.dart';
import 'package:flutter_clean_architecture/domain/domain_exports.dart';
import 'package:flutter_clean_architecture/features/login/login_const.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authUseCases)
      : super(LoginInitial(
          isPasswordObscured: true,
          currentMessageIndex: 0,
        )) {
    _startMessageRotation();
  }

  final AuthUseCases authUseCases;

  void togglePasswordVisibility() {
    final isPasswordVisible = !state.isPasswordObscured;
    emit(LoginLoaded(
      isPasswordObscured: isPasswordVisible,
      currentMessageIndex: state.currentMessageIndex,
    ));
  }

  void _startMessageRotation() {
    Timer.periodic(
      Duration(seconds: 3),
      (timer) {
        final currentMessageIndex = (state.currentMessageIndex + 1) % kWelcomeMessageList.length;
        emit(LoginLoaded(
          isPasswordObscured: state.isPasswordObscured,
          currentMessageIndex: currentMessageIndex,
        ));
      },
    );
  }

  void getUserSession(UserSessionRequestEntity request) async {
    emit(LoginLoading(
      isPasswordObscured: state.isPasswordObscured,
      currentMessageIndex: state.currentMessageIndex,
    ));
    final result = await authUseCases.getUserSession(request);
    result.when(
      (data) async {
        authNotifier.doLogin(data);
      },
      (error) {
        emit(LoginError(
          error.toString(),
          isPasswordObscured: state.isPasswordObscured,
          currentMessageIndex: state.currentMessageIndex,
        ));
        authNotifier.doLogout();
      },
    );
  }
}
