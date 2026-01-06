import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../widgets/common/custom_button.dart';
import '../../../widgets/common/custom_text_field.dart';
import '../../../core/utils/validators.dart';
import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Icon(
                Icons.phone_android_rounded,
                size: 60.sp,
                color: AppColors.primary,
              ),
              SizedBox(height: 24.h),
              Text(
                'login'.tr,
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'enter_phone'.tr,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.lightTextSecondary,
                ),
              ),
              SizedBox(height: 48.h),
              CustomTextField(
                controller: controller.phoneController,
                label: 'phone_number'.tr,
                hint: '10 digit mobile number',
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(Icons.phone_rounded),
                maxLength: 10,
                validator: Validators.validatePhone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              SizedBox(height: 32.h),
              Obx(
                () => CustomButton(
                  text: 'send_otp'.tr,
                  onPressed: controller.sendOTP,
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
