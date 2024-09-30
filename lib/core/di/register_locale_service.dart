import 'package:flutter_clean_architecture/core/environment/environment.dart';
import 'package:flutter_clean_architecture/core/service/flutter_secure_storage_service.dart';
import 'package:flutter_clean_architecture/core/service/location_service.dart';
import 'package:flutter_clean_architecture/core/service/shared_preferences_service.dart';
import 'package:get_it/get_it.dart';

void registerLocaleService(GetIt getIt, Environment environment) {
  getIt.registerSingleton(environment);
  getIt.registerSingleton(LocationService());

  // Local services
  getIt.registerSingleton(SharedPreferenceService());
  getIt.registerSingleton(FlutterSecureStorageService());
}
