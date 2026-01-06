import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../widgets/common/custom_button.dart';
import '../controllers/language_selection_controller.dart';

class LanguageSelectionView extends GetView<LanguageSelectionController> {
  const LanguageSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Icon(
                Icons.language_rounded,
                size: 60.sp,
                color: AppColors.primary,
              ),
              SizedBox(height: 24.h),
              Text(
                'select_language'.tr,
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Choose your preferred language',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.lightTextSecondary,
                ),
              ),
              SizedBox(height: 32.h),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.languageController.supportedLanguages.length,
                    itemBuilder: (context, index) {
                      final language = controller.languageController.supportedLanguages[index];
                      final locale = language['locale'] as Locale;
                      final isSelected = controller.selectedLocale.value == locale;

                      return Card(
                        margin: EdgeInsets.only(bottom: 12.h),
                        elevation: isSelected ? 4 : 1,
                        child: InkWell(
                          onTap: () => controller.selectLanguage(locale),
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: EdgeInsets.all(16.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected ? AppColors.primary : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 48.sp,
                                  height: 48.sp,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColors.primary.withOpacity(0.1)
                                        : AppColors.lightSurface,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.language_rounded,
                                    color: isSelected ? AppColors.primary : AppColors.lightTextSecondary,
                                    size: 24.sp,
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        language['name'] as String,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        language['nativeName'] as String,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.lightTextSecondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (isSelected)
                                  Icon(
                                    Icons.check_circle_rounded,
                                    color: AppColors.primary,
                                    size: 24.sp,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              CustomButton(
                text: 'continue'.tr,
                onPressed: controller.confirmLanguageSelection,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
