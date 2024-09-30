import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  Future<T?> getValue<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      if (T == String) {
        return prefs.getString(key) as T;
      }
      if (T == bool) {
        return prefs.getBool(key) as T;
      }
      if (T == int) {
        return prefs.getInt(key) as T;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<void> setValue<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      if (value is String) {
        await prefs.setString(key, value);
      }
      if (value is bool) {
        await prefs.setBool(key, value);
      }
      if (value is int) {
        await prefs.setInt(key, value);
      }
    } catch (e) {
      return;
    }
    return;
  }

  Future<Map<String, dynamic>> getJSON(String key) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final mapJSON = prefs.getString(key);
      return Map<String, dynamic>.from(jsonDecode(mapJSON ?? '{}'));
    } catch (e) {
      return {};
    }
  }

  Future<void> saveJSON(
    String key,
    Map<String, dynamic> map,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, jsonEncode(map));
  }

  Future<void> removeValue(String key) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      await prefs.remove(key);
    } catch (e) {
      return;
    }
    return;
  }

  Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      await prefs.clear();
    } catch (e) {
      return;
    }
    return;
  }
}
