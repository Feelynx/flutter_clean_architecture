import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterSecureStorageService {
  FlutterSecureStorageService({
    AndroidOptions? externalAndroidOptions,
    IOSOptions? externalIosOptions,
  })  : androidOptions = externalAndroidOptions ??
            const AndroidOptions(
              encryptedSharedPreferences: true,
            ),
        iosOptions = externalIosOptions ??
            const IOSOptions(
              accessibility: KeychainAccessibility.unlocked,
            );

  final storage = FlutterSecureStorage();
  final AndroidOptions androidOptions;
  final IOSOptions iosOptions;

  Future<String?> getValue({required String key}) async {
    return await storage.read(
      key: key,
      iOptions: iosOptions,
      aOptions: androidOptions,
    );
  }

  Future<void> setValue({required String key, required String value}) async {
    await storage.write(
      key: key,
      value: value,
      iOptions: iosOptions,
      aOptions: androidOptions,
    );
  }

  Future<Map<String, dynamic>> getJSON({required String key}) async {
    try {
      final mapJSON = await getValue(key: key);
      return Map<String, dynamic>.from(jsonDecode(mapJSON ?? '{}'));
    } catch (e) {
      return {};
    }
  }

  Future<void> saveJSON({
    required String key,
    required Map<String, dynamic> map,
  }) async {
    await setValue(
      key: key,
      value: jsonEncode(
        map,
      ),
    );
  }

  Future<void> removeValue(String key) async {
    await storage.delete(key: key, iOptions: iosOptions, aOptions: androidOptions);
  }

  Future<void> clearAllData() async {
    await storage.deleteAll(iOptions: iosOptions, aOptions: androidOptions);
  }
}
