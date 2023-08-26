







import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  static const token='token';
  static const accountType='account_type';
  static const firstOpen='first_open';
  static const locale='locale';
  static const theme='theme';
  static SharedPreferences? _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static setInt(String key, int value) {
    if (_prefs != null) _prefs!.setInt(key, value);
  }

  static int? getInteger(String key) {
    return  _prefs?.getInt(key) ;
  }

  static setString(String key, String value) {
    if (_prefs != null) _prefs!.setString(key, value);
  }

  static String? getString(String key) {
    return  _prefs?.getString(key) ;
  }

  static setBool(String key, bool value) {
    if (_prefs != null) _prefs!.setBool(key, value);
  }

  static bool? getBool(String key) {
    return  _prefs?.getBool(key) ;
  }

  static remove(String key) {
    return  _prefs?.remove(key) ;
  }
}
