import 'package:flutter_clean_architecture/core/di/shared_export.dart';
import 'package:flutter_clean_architecture/domain/domain_exports.dart';
import 'package:get_it/get_it.dart';

void registerUseCases(GetIt getIt) {
  getIt.registerFactory(() => AuthUseCases(authRepository, authLocalRepository));
  getIt.registerFactory(() => ProfileUseCases(authRepository));
  getIt.registerSingleton(AppSettingsUseCases(appSettingsLocalRepository));
}
