import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../widgets/common/custom_card.dart';
import '../controllers/training_controller.dart';

class TrainingView extends GetView<TrainingController> {
  const TrainingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my_training'.tr),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.sp),
        children: [
          Text(
            'training_modules'.tr,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          Obx(
            () => Column(
              children: controller.trainingModules.map((module) {
                return CustomCard(
                  padding: EdgeInsets.all(16.sp),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                          color: module['completed']
                              ? AppColors.success.withOpacity(0.1)
                              : AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          _getIcon(module['icon']),
                          color: module['completed']
                              ? AppColors.success
                              : AppColors.primary,
                          size: 28.sp,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              module['title'].toString().tr,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              module['description'],
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.lightTextSecondary,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time_rounded,
                                  size: 14.sp,
                                  color: AppColors.lightTextSecondary,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  module['duration'],
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.lightTextSecondary,
                                  ),
                                ),
                                if (module['completed']) ...[
                                  SizedBox(width: 12.w),
                                  Icon(
                                    Icons.check_circle_rounded,
                                    size: 14.sp,
                                    color: AppColors.success,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    'Completed',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.success,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: AppColors.lightTextSecondary,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'rocket':
        return Icons.rocket_launch_rounded;
      case 'lightbulb':
        return Icons.lightbulb_outline_rounded;
      case 'trending_up':
        return Icons.trending_up_rounded;
      case 'group':
        return Icons.groups_rounded;
      default:
        return Icons.school_rounded;
    }
  }
}
