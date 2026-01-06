import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../core/routes/app_routes.dart';

class SplashController extends GetxController {
  final _storage = GetStorage();
  final String _languageKey = 'selectedLanguage';
  final String _isLoggedInKey = 'isLoggedIn';

  @override
  void onReady() {
    super.onReady();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    // Short delay for smooth animation (1.5 seconds)
    await Future.delayed(const Duration(milliseconds: 1500));

    final hasSelectedLanguage = _storage.read(_languageKey) != null;
    final isLoggedIn = _storage.read(_isLoggedInKey) ?? false;

    // Debug logging
    print('🔍 Navigation Debug:');
    print('   hasSelectedLanguage: $hasSelectedLanguage');
    print('   isLoggedIn: $isLoggedIn');

    // Navigate based on app state with smooth transitions
    if (!hasSelectedLanguage) {
      print('   → Navigating to Language Selection');
      Get.offAllNamed(
        AppRoutes.languageSelection,
        predicate: (route) => false,
      );
    } else if (!isLoggedIn) {
      print('   → Navigating to Login');
      Get.offAllNamed(
        AppRoutes.login,
        predicate: (route) => false,
      );
    } else {
      print('   → Navigating to Home');
      Get.offAllNamed(
        AppRoutes.home,
        predicate: (route) => false,
      );
    }
  }
}
