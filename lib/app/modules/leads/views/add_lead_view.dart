import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widgets/common/custom_button.dart';
import '../../../widgets/common/custom_text_field.dart';
import '../../../core/utils/validators.dart';
import '../../../data/models/lead_model.dart';
import '../controllers/leads_controller.dart';

class AddLeadView extends GetView<LeadsController> {
  const AddLeadView({super.key});

  @override
  Widget build(BuildContext context) {
    final isEdit = controller.selectedLead.value != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'edit_lead'.tr : 'new_lead'.tr),
        actions: [
          if (isEdit)
            IconButton(
              icon: const Icon(Icons.delete_outline_rounded),
              onPressed: () => controller.deleteLead(controller.selectedLead.value!.id),
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: controller.nameController,
              label: 'lead_name'.tr,
              hint: 'Enter full name',
              prefixIcon: const Icon(Icons.person_outline_rounded),
              validator: Validators.validateName,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: controller.phoneController,
              label: 'lead_phone'.tr,
              hint: '10 digit mobile number',
              keyboardType: TextInputType.phone,
              prefixIcon: const Icon(Icons.phone_rounded),
              maxLength: 10,
              validator: Validators.validatePhone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: controller.emailController,
              label: 'lead_email'.tr,
              hint: 'Email (optional)',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email_outlined),
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: controller.sourceController,
              label: 'lead_source'.tr,
              hint: 'e.g., Facebook, Referral, WhatsApp',
              prefixIcon: const Icon(Icons.source_rounded),
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 16.h),
            Text(
              'lead_status'.tr,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),
            Obx(
              () => Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: LeadStatus.values.map((status) {
                  final isSelected = controller.selectedStatus.value == status;
                  return ChoiceChip(
                    label: Text(status.toString().split('.').last.tr),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) {
                        controller.selectedStatus.value = status;
                      }
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: controller.notesController,
              label: 'lead_notes'.tr,
              hint: 'Add notes about this lead',
              prefixIcon: const Icon(Icons.note_outlined),
              maxLines: 4,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: 32.h),
            Obx(
              () => CustomButton(
                text: isEdit ? 'save'.tr : 'add'.tr,
                onPressed: isEdit ? controller.updateLead : controller.addLead,
                isLoading: controller.isLoading.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
