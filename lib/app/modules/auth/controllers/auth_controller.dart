import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../core/routes/app_routes.dart';

class AuthController extends GetxController {
  final _storage = GetStorage();
  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  final isLoading = false.obs;
  final otpSent = false.obs;
  final canResendOTP = false.obs;
  final resendTimer = 30.obs;

  @override
  void onClose() {
    phoneController.dispose();
    otpController.dispose();
    super.onClose();
  }

  Future<void> sendOTP() async {
    if (phoneController.text.isEmpty || phoneController.text.length != 10) {
      Get.snackbar('error'.tr, 'invalid_phone'.tr, snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;

    otpSent.value = true;
    Get.toNamed(AppRoutes.otpVerification);
    Get.snackbar('success'.tr, 'otp_sent'.tr, snackPosition: SnackPosition.BOTTOM);

    _startResendTimer();
  }

  Future<void> verifyOTP() async {
    if (otpController.text.isEmpty || otpController.text.length != 6) {
      Get.snackbar('error'.tr, 'invalid_otp'.tr, snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;

    _storage.write('isLoggedIn', true);
    _storage.write('phoneNumber', phoneController.text);

    Get.offAllNamed(AppRoutes.home);
    Get.snackbar('success'.tr, 'otp_verified'.tr, snackPosition: SnackPosition.BOTTOM);
  }

  Future<void> resendOTP() async {
    if (!canResendOTP.value) return;

    canResendOTP.value = false;
    resendTimer.value = 30;

    await Future.delayed(const Duration(seconds: 1));
    Get.snackbar('success'.tr, 'otp_sent'.tr, snackPosition: SnackPosition.BOTTOM);

    _startResendTimer();
  }

  void _startResendTimer() {
    canResendOTP.value = false;
    resendTimer.value = 30;

    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (resendTimer.value > 0) {
        resendTimer.value--;
        return true;
      } else {
        canResendOTP.value = true;
        return false;
      }
    });
  }
}
