import 'package:flutter_clean_architecture/core/di/shared_export.dart';
import 'package:flutter_clean_architecture/data/data_exports.dart';
import 'package:get_it/get_it.dart';

void registerDataSources(GetIt getIt) {
  getIt.registerSingleton<AuthRemoteDataSource>(
    AuthRemoteDataSourceImpl(client: authApiClient),
  );
  getIt.registerSingleton<AppSettingsLocalDataSource>(
    AppSettingsLocalDataSourceImpl(sharedPreferenceService: sharedPreferenceService),
  );
  getIt.registerSingleton<AuthLocalDataSource>(
    AuthLocalDataSourceImpl(flutterSecureStorageService: flutterSecureStorageService),
  );
}
