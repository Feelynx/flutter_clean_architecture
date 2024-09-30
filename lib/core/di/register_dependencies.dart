import 'package:flutter_clean_architecture/core/di/register_api_client.dart';
import 'package:flutter_clean_architecture/core/di/register_data_sources.dart';
import 'package:flutter_clean_architecture/core/di/register_locale_service.dart';
import 'package:flutter_clean_architecture/core/di/register_repositories.dart';
import 'package:flutter_clean_architecture/core/di/shared_export.dart';
import 'package:flutter_clean_architecture/core/environment/environment.dart';
import 'package:flutter_clean_architecture/core/notifier/auth_notifier.dart';
import 'package:get_it/get_it.dart';

import 'register_use_cases.dart';

void registerDependencies(Environment environment) {
  final getIt = GetIt.I;

  // Locale app service
  registerLocaleService(getIt, environment);

  // Api Client
  registerApiClient(getIt, environment);

  // Register Data Sources
  registerDataSources(getIt);

  // Register Repositories
  registerRepositories(getIt);

  // Register Use Cases
  registerUseCases(getIt);

  // Notifier
  getIt.registerSingleton(AuthNotifier(authUseCases: authUseCases));
}
