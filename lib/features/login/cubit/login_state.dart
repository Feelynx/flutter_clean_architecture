part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  final bool isPasswordObscured;
  final int currentMessageIndex;

  const LoginState({required this.isPasswordObscured, required this.currentMessageIndex});

  @override
  List<Object> get props => [isPasswordObscured, currentMessageIndex];
}

class LoginInitial extends LoginState {
  LoginInitial({required super.isPasswordObscured, required super.currentMessageIndex});
}

class LoginLoaded extends LoginState {
  LoginLoaded({required super.isPasswordObscured, required super.currentMessageIndex});
}

class LoginLoading extends LoginState {
  LoginLoading({required super.isPasswordObscured, required super.currentMessageIndex});
}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message, {required super.isPasswordObscured, required super.currentMessageIndex});
}
