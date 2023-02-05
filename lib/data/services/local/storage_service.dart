import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/env.dart';

class LocalStorageService {
  static late LocalStorageService instance;
  static late SharedPreferences _preferences;

  static Future<LocalStorageService> getInstance() async {
    instance = LocalStorageService();
    _preferences = await SharedPreferences.getInstance();

    return instance;
  }

  dynamic _getFromDisk(String key) {
    final dynamic value = _preferences.get(key);
    return value;
  }

  void _saveToDisk<T>(String key, T content) {
    if (content is String) {
      _preferences.setString(key, content);
    } else if (content is bool) {
      _preferences.setBool(key, content);
    } else if (content is int) {
      _preferences.setInt(key, content);
    } else if (content is double) {
      _preferences.setDouble(key, content);
    } else if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }

  set isKutaBeachLiked(bool isKutaBeachLiked) {
    _saveToDisk(kutaBeachLiked, isKutaBeachLiked);
  }

  set isBagaBeachLiked(bool isBagaBeachLiked) {
    _saveToDisk(bagaBeachLiked, isBagaBeachLiked);
  }

  set isKutaResortLiked(bool isKutaResortLiked) {
    _saveToDisk(kutaResortLiked, isKutaResortLiked);
  }

  set isBagaBeachResortLiked(bool isBagaBeachResortLiked) {
    _saveToDisk(bagaBeachResortLiked, isBagaBeachResortLiked);
  }

  // getters
  bool get isKutaBeachLiked => _getFromDisk(kutaBeachLiked) ?? false;
  bool get isBagaBeachLiked => _getFromDisk(bagaBeachLiked) ?? false;
  bool get isKutaResortLiked => _getFromDisk(kutaResortLiked) ?? false;
  bool get isBagaBeachResortLiked =>
      _getFromDisk(bagaBeachResortLiked) ?? false;
}
