import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/routes/app_routes.dart';
import '../../../data/models/lead_model.dart';
import '../../../widgets/common/custom_card.dart';
import '../../../widgets/common/empty_state_widget.dart';
import '../controllers/leads_controller.dart';

class LeadsView extends GetView<LeadsController> {
  const LeadsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my_leads'.tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(() {
        if (controller.leads.isEmpty) {
          return EmptyStateWidget(
            icon: Icons.people_outline_rounded,
            title: 'no_data'.tr,
            message: 'Add your first lead to get started',
            actionText: 'add_lead'.tr,
            onActionPressed: () => Get.toNamed(AppRoutes.addLead),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.refreshLeads,
          child: ListView.builder(
            padding: EdgeInsets.all(16.sp),
            itemCount: controller.leads.length,
            itemBuilder: (context, index) {
              final lead = controller.leads[index];
              return CustomCard(
                onTap: () {
                  controller.selectLeadForView(lead);
                  Get.toNamed(AppRoutes.leadDetails);
                },
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24.sp,
                          backgroundColor: AppColors.primary.withOpacity(0.1),
                          child: Text(
                            lead.name[0].toUpperCase(),
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                lead.name,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone_rounded,
                                    size: 14.sp,
                                    color: AppColors.lightTextSecondary,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    lead.phone,
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
                        _buildStatusChip(lead.status),
                      ],
                    ),
                    if (lead.notes != null) ...[
                      SizedBox(height: 12.h),
                      Text(
                        lead.notes!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.lightTextSecondary,
                        ),
                      ),
                    ],
                  ],
                ),
              );
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.addLead),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }

  Widget _buildStatusChip(status) {
    Color color;
    switch (status) {
      case LeadStatus.interested:
        color = AppColors.success;
        break;
      case LeadStatus.contacted:
        color = AppColors.info;
        break;
      case LeadStatus.notInterested:
        color = AppColors.error;
        break;
      case LeadStatus.converted:
        color = AppColors.secondary;
        break;
      default:
        color = AppColors.warning;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status.toString().split('.').last.tr,
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
