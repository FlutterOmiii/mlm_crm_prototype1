import 'package:get/get.dart';

class FollowupsController extends GetxController {
  final followups = [].obs;

  @override
  void onInit() {
    super.onInit();
    _loadSampleFollowups();
  }

  void _loadSampleFollowups() {
    followups.value = [
      {
        'name': 'Follow up with Rahul',
        'date': '2026-01-07',
        'time': '10:00 AM',
        'phone': '9876543210',
        'notes': 'Discuss starter package pricing',
      },
      {
        'name': 'Call Priya for demo',
        'date': '2026-01-08',
        'time': '2:00 PM',
        'phone': '9876543211',
        'notes': 'Schedule product demonstration',
      },
    ];
  }

  Future<void> refreshFollowups() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
