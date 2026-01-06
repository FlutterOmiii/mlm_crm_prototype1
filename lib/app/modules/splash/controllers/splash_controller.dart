import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../core/routes/app_routes.dart';

class SplashController extends GetxController {
  final _storage = GetStorage();
  final String _languageKey = 'selectedLanguage';
  final String _isLoggedInKey = 'isLoggedIn';

  @override
  void onInit() {
    super.onInit();
    print('✅ SplashController initialized');
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    print('⏳ Starting navigation delay...');
    await Future.delayed(const Duration(milliseconds: 1500));

    final hasSelectedLanguage = _storage.read(_languageKey) != null;
    final isLoggedIn = _storage.read(_isLoggedInKey) ?? false;

    print('🔍 Navigation Check:');
    print('   Language selected: $hasSelectedLanguage');
    print('   Logged in: $isLoggedIn');

    try {
      if (!hasSelectedLanguage) {
        print('🚀 Going to Language Selection');
        await Get.offAllNamed(AppRoutes.languageSelection);
      } else if (!isLoggedIn) {
        print('🚀 Going to Login');
        await Get.offAllNamed(AppRoutes.login);
      } else {
        print('🚀 Going to Home');
        await Get.offAllNamed(AppRoutes.home);
      }
    } catch (e) {
      print('❌ Navigation Error: $e');
    }
  }
}
