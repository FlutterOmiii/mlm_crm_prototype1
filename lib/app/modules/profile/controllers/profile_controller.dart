import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/theme/theme_controller.dart';
import '../../../core/localization/language_controller.dart';

class ProfileController extends GetxController {
  final _storage = GetStorage();
  final themeController = Get.find<ThemeController>();
  final languageController = Get.find<LanguageController>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  final pushNotifications = true.obs;
  final emailNotifications = true.obs;

  @override
  void onInit() {
    super.onInit();
    _loadProfile();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.onClose();
  }

  void _loadProfile() {
    nameController.text = _storage.read('userName') ?? 'John Doe';
    emailController.text = _storage.read('userEmail') ?? '';
    phoneController.text = _storage.read('phoneNumber') ?? '';
    addressController.text = _storage.read('userAddress') ?? '';
  }

  Future<void> updateProfile() async {
    _storage.write('userName', nameController.text);
    _storage.write('userEmail', emailController.text);
    _storage.write('userAddress', addressController.text);

    Get.back();
    Get.snackbar('success'.tr, 'profile_updated'.tr, snackPosition: SnackPosition.BOTTOM);
  }

  void logout() {
    Get.dialog(
      AlertDialog(
        title: Text('logout'.tr),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('cancel'.tr),
          ),
          TextButton(
            onPressed: () {
              _storage.remove('isLoggedIn');
              Get.offAllNamed(AppRoutes.login);
            },
            child: Text('logout'.tr),
          ),
        ],
      ),
    );
  }
}
