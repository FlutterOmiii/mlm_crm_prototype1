import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widgets/common/custom_button.dart';
import '../../../widgets/common/custom_text_field.dart';

class AddFollowupView extends StatelessWidget {
  const AddFollowupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('new_followup'.tr),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          children: [
            const CustomTextField(
              label: 'Lead Name',
              prefixIcon: Icon(Icons.person_outline_rounded),
            ),
            SizedBox(height: 16.h),
            const CustomTextField(
              label: 'Followup Date',
              prefixIcon: Icon(Icons.calendar_today_rounded),
              readOnly: true,
            ),
            SizedBox(height: 16.h),
            const CustomTextField(
              label: 'Followup Time',
              prefixIcon: Icon(Icons.access_time_rounded),
              readOnly: true,
            ),
            SizedBox(height: 16.h),
            const CustomTextField(
              label: 'Notes',
              prefixIcon: Icon(Icons.note_outlined),
              maxLines: 4,
            ),
            SizedBox(height: 32.h),
            CustomButton(
              text: 'add'.tr,
              onPressed: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }
}
