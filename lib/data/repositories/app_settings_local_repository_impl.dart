import 'package:flutter_clean_architecture/data/datasources/local/app_settings_local_data_source.dart';
import 'package:flutter_clean_architecture/domain/entities/app_settings_entity.dart';
import 'package:flutter_clean_architecture/domain/repositories/app_settings_local_repository.dart';

class AppSettingsLocalRepositoryImpl implements AppSettingsLocalRepository {
  final AppSettingsLocalDataSource _appSettingsLocalDataSource;

  AppSettingsLocalRepositoryImpl({required AppSettingsLocalDataSource appSettingsLocalDataSource})
      : _appSettingsLocalDataSource = appSettingsLocalDataSource;

  @override
  Future<void> setAppSettings(AppSettingsEntity appSettings) {
    return _appSettingsLocalDataSource.setAppSettings(appSettings.toDTO());
  }

  @override
  Future<AppSettingsEntity> getAppSettings() async {
    final appSettingsDTO = await _appSettingsLocalDataSource.getAppSettings();
    return appSettingsDTO.toEntity();
  }
}
