import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/localization/language_controller.dart';
import '../../../core/routes/app_routes.dart';

class LanguageSelectionController extends GetxController {
  final languageController = Get.find<LanguageController>();
  final selectedLocale = Rx<Locale?>(null);

  @override
  void onInit() {
    super.onInit();
    selectedLocale.value = languageController.currentLocale;
  }

  void selectLanguage(Locale locale) {
    selectedLocale.value = locale;
  }

  void confirmLanguageSelection() {
    if (selectedLocale.value != null) {
      languageController.changeLanguage(selectedLocale.value!);
      Get.offAllNamed(AppRoutes.login);
    } else {
      Get.snackbar(
        'error'.tr,
        'Please select a language',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
