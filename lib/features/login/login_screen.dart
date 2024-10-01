import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/utils/validator.dart';
import 'package:flutter_clean_architecture/domain/entities/user_session_request_entity.dart';
import 'package:flutter_clean_architecture/core/shared/context_extension.dart';
import 'package:flutter_clean_architecture/features/login/login_const.dart';
import 'package:flutter_clean_architecture/features/login/cubit/login_cubit.dart';
import 'package:flutter_clean_architecture/features/shared/error_dialog.dart';
import 'package:flutter_clean_architecture/features/shared/loading_widget.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late Validator emailValidator;
  late Validator passwordValidator;

  @override
  void initState() {
    super.initState();
    emailValidator = Validator<String>([
      (value) => value.isEmpty ? context.l10n.requiredField : null,
      // Regex for email validation
      //(value) => !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value) ? 'Invalid email' : null,
    ]);
    passwordValidator = Validator<String>([
      (value) => value.isEmpty ? context.l10n.requiredField : null,
    ]);
  }

  void doLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      final request = UserSessionRequestEntity(
        username: _emailController.text,
        password: _passwordController.text,
      );
      context.read<LoginCubit>().getUserSession(request);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginError) {
            ErrorDialog.showErrorDialog(
              context: context,
              title: context.l10n.login_error,
              message: state.message,
              onClose: () {},
              onRetry: () => doLogin(),
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              SafeArea(
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(seconds: 1),
                          child: Text(
                            kWelcomeMessageList[state.currentMessageIndex],
                            key: ValueKey<String>(kWelcomeMessageList[state.currentMessageIndex]),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    labelText: context.l10n.email,
                                    prefixIcon: Icon(Icons.email),
                                  ),
                                  validator: emailValidator.validate,
                                ),
                                const Gap(24),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: state.isPasswordObscured,
                                  decoration: InputDecoration(
                                    labelText: context.l10n.password,
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      icon: Icon(state.isPasswordObscured ? Icons.visibility : Icons.visibility_off),
                                      onPressed: () => context.read<LoginCubit>().togglePasswordVisibility(),
                                    ),
                                  ),
                                  validator: passwordValidator.validate,
                                ),
                              ],
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: doLogin,
                          child: Text(context.l10n.login),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (state is LoginLoading) const LoadingWidget(),
            ],
          );
        },
      ),
    );
  }
}
