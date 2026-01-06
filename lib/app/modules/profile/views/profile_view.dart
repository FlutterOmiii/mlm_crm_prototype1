import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/routes/app_routes.dart';
import '../../../widgets/common/custom_card.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile'.tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_rounded),
            onPressed: () => Get.toNamed(AppRoutes.editProfile),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.sp),
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 48.sp,
                  backgroundColor: AppColors.primary.withOpacity(0.1),
                  child: Text(
                    controller.nameController.text[0].toUpperCase(),
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  controller.nameController.text,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (controller.emailController.text.isNotEmpty) ...[
                  SizedBox(height: 4.h),
                  Text(
                    controller.emailController.text,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.lightTextSecondary,
                    ),
                  ),
                ],
              ],
            ),
          ),
          SizedBox(height: 32.h),
          _buildMenuItem(
            Icons.person_outline_rounded,
            'edit_profile'.tr,
            () => Get.toNamed(AppRoutes.editProfile),
          ),
          _buildMenuItem(
            Icons.settings_rounded,
            'settings'.tr,
            () => Get.toNamed(AppRoutes.settings),
          ),
          _buildMenuItem(
            Icons.help_outline_rounded,
            'Help & Support',
            () {},
          ),
          _buildMenuItem(
            Icons.info_outline_rounded,
            'About',
            () {},
          ),
          SizedBox(height: 16.h),
          _buildMenuItem(
            Icons.logout_rounded,
            'logout'.tr,
            controller.logout,
            color: AppColors.error,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap, {Color? color}) {
    return CustomCard(
      onTap: onTap,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      margin: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Icon(icon, color: color ?? AppColors.primary, size: 24.sp),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: AppColors.lightTextSecondary,
          ),
        ],
      ),
    );
  }
}
