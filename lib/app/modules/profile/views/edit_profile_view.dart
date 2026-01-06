import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widgets/common/custom_button.dart';
import '../../../widgets/common/custom_text_field.dart';
import '../../../core/utils/validators.dart';
import '../controllers/profile_controller.dart';

class EditProfileView extends GetView<ProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('edit_profile'.tr),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            CustomTextField(
              controller: controller.nameController,
              label: 'full_name'.tr,
              prefixIcon: const Icon(Icons.person_outline_rounded),
              validator: Validators.validateName,
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: controller.emailController,
              label: 'email'.tr,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email_outlined),
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: controller.phoneController,
              label: 'phone'.tr,
              keyboardType: TextInputType.phone,
              prefixIcon: const Icon(Icons.phone_rounded),
              enabled: false,
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: controller.addressController,
              label: 'address'.tr,
              prefixIcon: const Icon(Icons.location_on_outlined),
              maxLines: 3,
            ),
            SizedBox(height: 32.h),
            CustomButton(
              text: 'save'.tr,
              onPressed: controller.updateProfile,
            ),
          ],
        ),
      ),
    );
  }
}
