import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../widgets/common/custom_button.dart';
import '../../../widgets/common/custom_text_field.dart';
import '../../../core/utils/validators.dart';
import '../controllers/auth_controller.dart';

class OtpVerificationView extends GetView<AuthController> {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Icon(
                Icons.sms_rounded,
                size: 60.sp,
                color: AppColors.primary,
              ),
              SizedBox(height: 24.h),
              Text(
                'verify_otp'.tr,
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                '${'enter_otp'.tr} sent to +91 ${controller.phoneController.text}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.lightTextSecondary,
                ),
              ),
              SizedBox(height: 48.h),
              CustomTextField(
                controller: controller.otpController,
                label: 'enter_otp'.tr,
                hint: '6 digit OTP',
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(Icons.lock_rounded),
                maxLength: 6,
                validator: Validators.validateOTP,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 24.h),
              Center(
                child: Obx(
                  () => controller.canResendOTP.value
                      ? TextButton(
                          onPressed: controller.resendOTP,
                          child: Text('resend_otp'.tr),
                        )
                      : Text(
                          'Resend OTP in ${controller.resendTimer.value}s',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.lightTextSecondary,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 32.h),
              Obx(
                () => CustomButton(
                  text: 'verify_otp'.tr,
                  onPressed: controller.verifyOTP,
                  isLoading: controller.isLoading.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
