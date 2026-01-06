import 'package:get/get.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;

  final totalEarnings = 125000.0.obs;
  final monthlyEarnings = 45000.0.obs;
  final todayEarnings = 2500.0.obs;
  final activeLeads = 48.obs;
  final pendingFollowups = 12.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  Future<void> refreshData() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
