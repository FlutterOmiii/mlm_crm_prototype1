import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  final _storage = GetStorage();
  final _currentLocale = const Locale('en', 'US').obs;
  final String _languageKey = 'selectedLanguage';

  Locale get currentLocale => _currentLocale.value;
  String get currentLanguageCode => _currentLocale.value.toString();

  final List<Map<String, dynamic>> supportedLanguages = [
    {
      'name': 'English',
      'locale': const Locale('en', 'US'),
      'code': 'en_US',
      'nativeName': 'English'
    },
    {
      'name': 'Hindi',
      'locale': const Locale('hi', 'IN'),
      'code': 'hi_IN',
      'nativeName': 'हिन्दी'
    },
    {
      'name': 'Marathi',
      'locale': const Locale('mr', 'IN'),
      'code': 'mr_IN',
      'nativeName': 'मराठी'
    },
    {
      'name': 'Hinglish',
      'locale': const Locale('hinglish'),
      'code': 'hinglish',
      'nativeName': 'Hinglish'
    },
  ];

  @override
  void onInit() {
    super.onInit();
    _loadLanguageFromStorage();
  }

  void _loadLanguageFromStorage() {
    final savedLanguage = _storage.read(_languageKey);
    if (savedLanguage != null) {
      final locale = _getLocaleFromCode(savedLanguage);
      if (locale != null) {
        _currentLocale.value = locale;
        Get.updateLocale(locale);
      }
    }
  }

  Locale? _getLocaleFromCode(String code) {
    try {
      final language = supportedLanguages.firstWhere(
        (lang) => lang['code'] == code,
      );
      return language['locale'] as Locale;
    } catch (e) {
      return null;
    }
  }

  void changeLanguage(Locale locale) {
    _currentLocale.value = locale;
    final code = supportedLanguages.firstWhere(
      (lang) => lang['locale'] == locale,
      orElse: () => supportedLanguages[0],
    )['code'] as String;

    _storage.write(_languageKey, code);
    Get.updateLocale(locale);
  }

  String getLanguageName(Locale locale) {
    final language = supportedLanguages.firstWhere(
      (lang) => lang['locale'] == locale,
      orElse: () => supportedLanguages[0],
    );
    return language['name'] as String;
  }

  String getLanguageNativeName(Locale locale) {
    final language = supportedLanguages.firstWhere(
      (lang) => lang['locale'] == locale,
      orElse: () => supportedLanguages[0],
    );
    return language['nativeName'] as String;
  }
}
