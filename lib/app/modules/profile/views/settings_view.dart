import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../widgets/common/custom_card.dart';
import '../controllers/profile_controller.dart';

class SettingsView extends GetView<ProfileController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.sp),
        children: [
          Text(
            'appearance'.tr,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.lightTextSecondary,
            ),
          ),
          SizedBox(height: 8.h),
          CustomCard(
            padding: EdgeInsets.all(16.sp),
            child: Row(
              children: [
                Icon(Icons.dark_mode_rounded, color: AppColors.primary),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    'dark_mode'.tr,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
                Obx(
                  () => Switch(
                    value: controller.themeController.isDarkMode,
                    onChanged: (_) => controller.themeController.toggleTheme(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          CustomCard(
            padding: EdgeInsets.all(16.sp),
            child: Row(
              children: [
                Icon(Icons.language_rounded, color: AppColors.primary),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'language'.tr,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      SizedBox(height: 4.h),
                      Obx(
                        () => Text(
                          controller.languageController.getLanguageName(
                            controller.languageController.currentLocale,
                          ),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.lightTextSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right_rounded, color: AppColors.lightTextSecondary),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'notifications'.tr,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.lightTextSecondary,
            ),
          ),
          SizedBox(height: 8.h),
          CustomCard(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.notifications_rounded, color: AppColors.primary),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Text(
                        'push_notifications'.tr,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    Obx(
                      () => Switch(
                        value: controller.pushNotifications.value,
                        onChanged: (value) => controller.pushNotifications.value = value,
                      ),
                    ),
                  ],
                ),
                Divider(height: 24.h),
                Row(
                  children: [
                    Icon(Icons.email_rounded, color: AppColors.primary),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Text(
                        'email_notifications'.tr,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    Obx(
                      () => Switch(
                        value: controller.emailNotifications.value,
                        onChanged: (value) => controller.emailNotifications.value = value,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
