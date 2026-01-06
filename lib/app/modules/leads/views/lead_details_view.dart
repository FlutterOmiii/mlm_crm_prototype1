import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/routes/app_routes.dart';
import '../../../widgets/common/custom_card.dart';
import '../../../widgets/common/custom_button.dart';
import '../controllers/leads_controller.dart';

class LeadDetailsView extends GetView<LeadsController> {
  const LeadDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final lead = controller.selectedLead.value!;

    return Scaffold(
      appBar: AppBar(
        title: Text('lead_details'.tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_rounded),
            onPressed: () {
              controller.selectLeadForEdit(lead);
              Get.toNamed(AppRoutes.editLead);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline_rounded),
            onPressed: () => controller.deleteLead(lead.id),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 48.sp,
                backgroundColor: AppColors.primary.withOpacity(0.1),
                child: Text(
                  lead.name[0].toUpperCase(),
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Center(
              child: Text(
                lead.name,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  lead.statusText.tr,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'call_now'.tr,
                    icon: const Icon(Icons.call_rounded, color: Colors.white),
                    onPressed: () => _makePhoneCall(lead.phone),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: CustomButton(
                    text: 'WhatsApp',
                    icon: const Icon(Icons.chat_rounded, color: Colors.white),
                    backgroundColor: const Color(0xFF25D366),
                    onPressed: () => _openWhatsApp(lead.phone),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            _buildInfoSection('Contact Information', [
              _buildInfoRow(Icons.phone_rounded, 'Phone', lead.phone),
              if (lead.email != null)
                _buildInfoRow(Icons.email_outlined, 'Email', lead.email!),
              if (lead.source != null)
                _buildInfoRow(Icons.source_rounded, 'Source', lead.source!),
            ]),
            SizedBox(height: 16.h),
            if (lead.notes != null)
              _buildInfoSection('Notes', [
                Text(
                  lead.notes!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.lightTextSecondary,
                  ),
                ),
              ]),
            SizedBox(height: 16.h),
            _buildInfoSection('Timeline', [
              _buildInfoRow(
                Icons.add_circle_outline_rounded,
                'Created',
                _formatDate(lead.createdAt),
              ),
              _buildInfoRow(
                Icons.update_rounded,
                'Last Updated',
                _formatDate(lead.updatedAt),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, List<Widget> children) {
    return CustomCard(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12.h),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Icon(icon, size: 20.sp, color: AppColors.primary),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.lightTextSecondary,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
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
