import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/routes/app_routes.dart';
import '../../../widgets/common/custom_card.dart';
import '../../../widgets/common/empty_state_widget.dart';
import '../controllers/followups_controller.dart';

class FollowupsView extends GetView<FollowupsController> {
  const FollowupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my_followups'.tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(() {
        if (controller.followups.isEmpty) {
          return EmptyStateWidget(
            icon: Icons.event_available_rounded,
            title: 'no_data'.tr,
            message: 'Add your first follow-up',
            actionText: 'add_followup'.tr,
            onActionPressed: () => Get.toNamed(AppRoutes.addFollowup),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.refreshFollowups,
          child: ListView.builder(
            padding: EdgeInsets.all(16.sp),
            itemCount: controller.followups.length,
            itemBuilder: (context, index) {
              final followup = controller.followups[index];
              return CustomCard(
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                            color: AppColors.secondary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.event_rounded,
                            color: AppColors.secondary,
                            size: 20.sp,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                followup['name'],
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_rounded,
                                    size: 12.sp,
                                    color: AppColors.lightTextSecondary,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    '${followup['date']} at ${followup['time']}',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.lightTextSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (followup['notes'] != null) ...[
                      SizedBox(height: 12.h),
                      Text(
                        followup['notes'],
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.lightTextSecondary,
                        ),
                      ),
                    ],
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => _makePhoneCall(followup['phone']),
                            icon: const Icon(Icons.call_rounded),
                            label: Text('call_now'.tr),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => _openWhatsApp(followup['phone']),
                            icon: const Icon(Icons.chat_rounded),
                            label: const Text('WhatsApp'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF25D366),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.addFollowup),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }

  Future<void> _makePhoneCall(String phone) async {
    final uri = Uri.parse('tel:+91$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _openWhatsApp(String phone) async {
    final uri = Uri.parse('https://wa.me/91$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
