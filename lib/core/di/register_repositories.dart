import 'package:flutter_clean_architecture/core/di/shared_export.dart';
import 'package:flutter_clean_architecture/data/data_exports.dart';
import 'package:flutter_clean_architecture/domain/domain_exports.dart';
import 'package:get_it/get_it.dart';

void registerRepositories(GetIt getIt) {
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(authRemoteDataSource: authRemoteDataSource),
  );
  getIt.registerSingleton<AppSettingsLocalRepository>(
    AppSettingsLocalRepositoryImpl(appSettingsLocalDataSource: appSettingsLocalDataSource),
  );
  getIt.registerSingleton<AuthLocalRepository>(
    AuthLocalRepositoryImpl(authLocalDataSource: authLocalDataSource),
  );
}
