import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/constants/app_constants.dart';

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

    // Navigate based on app state with smooth transitions
    if (!hasSelectedLanguage) {
      Get.offAllNamed(
        AppRoutes.languageSelection,
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 400),
      );
    } else if (!isLoggedIn) {
      Get.offAllNamed(
        AppRoutes.login,
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 400),
      );
    } else {
      Get.offAllNamed(
        AppRoutes.home,
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 400),
      );
    }
  }
}
