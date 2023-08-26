import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/data/cache/shared_prefs.dart';

final settingProvider = ChangeNotifierProvider<DevicePreferences>((ref) {
  return DevicePreferences();
});

class DevicePreferences extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  Locale locale = const Locale('ar', '');
  void changeLang(String t) {
    locale = Locale(t, '');
    notifyListeners();
    CacheManager.setString(CacheManager.locale, t);
  }

  void getLang() {
    locale = Locale(CacheManager.getString(CacheManager.locale) ?? 'en', '');
    notifyListeners();
  }

  void getTheme() {
    themeMode = ThemeMode.values.firstWhere((element) =>
        element.name ==
        (CacheManager.getString(CacheManager.theme) ?? ThemeMode.dark.name));
    notifyListeners();
  }

  void toggleTheme(ThemeMode th) {
    themeMode = th;
    CacheManager.setString(CacheManager.theme, themeMode.name);
    notifyListeners();
  }
}
