import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _storage = GetStorage();
  final _isDarkMode = false.obs;
  final String _themeKey = 'isDarkMode';

  bool get isDarkMode => _isDarkMode.value;
  ThemeMode get themeMode => _isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromStorage();
  }

  void _loadThemeFromStorage() {
    _isDarkMode.value = _storage.read(_themeKey) ?? false;
  }

  void toggleTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    _storage.write(_themeKey, _isDarkMode.value);
    Get.changeThemeMode(themeMode);
  }

  void setThemeMode(bool isDark) {
    _isDarkMode.value = isDark;
    _storage.write(_themeKey, isDark);
    Get.changeThemeMode(themeMode);
  }

  void setSystemTheme() {
    final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    _isDarkMode.value = brightness == Brightness.dark;
    _storage.write(_themeKey, _isDarkMode.value);
    Get.changeThemeMode(themeMode);
  }
}
