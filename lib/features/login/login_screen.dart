import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/domain/entities/user_session_request_entity.dart';
import 'package:flutter_clean_architecture/core/shared/context_extension.dart';
import 'package:flutter_clean_architecture/features/login/cubit/login_cubit.dart';
import 'package:flutter_clean_architecture/features/shared/error_dialog.dart';
import 'package:flutter_clean_architecture/features/shared/loading_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          ErrorDialog.showErrorDialog(
            context: context,
            title: 'Errore login',
            message: state.message,
          );
        }
      },
      builder: (context, state) {
        switch (state) {
          case LoginInitial() || LoginError():
            return Scaffold(
              body: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: context.l10n.email,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return context.l10n.requiredField;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: context.l10n.password,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return context.l10n.requiredField;
                          }
                          if (value.length < 6) {
                            return context.l10n.shortPassword;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            final request = UserSessionRequestEntity(
                              username: _emailController.text,
                              password: _passwordController.text,
                            );
                            context.read<LoginCubit>().login(request);
                          }
                        },
                        child: Text(context.l10n.login),
                      ),
                    ],
                  ),
                ),
              ),
            );
          case LoginLoading():
            return const LoadingWidget();
          default:
            return Container();
        }
      },
    );
  }
}
