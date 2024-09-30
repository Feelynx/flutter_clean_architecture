import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/di/register_dependencies.dart';
import 'package:flutter_clean_architecture/core/di/shared_export.dart';
import 'package:flutter_clean_architecture/core/environment/environment.dart';

Future<void> bootstrap(Environment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  registerDependencies(environment);
  await authNotifier.checkToken();
}
