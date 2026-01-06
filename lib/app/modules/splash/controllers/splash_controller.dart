import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/constants/app_constants.dart';

class SplashController extends GetxController {
  final _storage = GetStorage();
  final String _languageKey = 'selectedLanguage';
  final String _isLoggedInKey = 'isLoggedIn';

  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(AppConstants.splashDuration);

    final hasSelectedLanguage = _storage.read(_languageKey) != null;
    final isLoggedIn = _storage.read(_isLoggedInKey) ?? false;

    if (!hasSelectedLanguage) {
      Get.offAllNamed(AppRoutes.languageSelection);
    } else if (!isLoggedIn) {
      Get.offAllNamed(AppRoutes.login);
    } else {
      Get.offAllNamed(AppRoutes.home);
    }
  }
}
