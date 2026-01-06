import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mlm_crm_prototype1/app/modules/auth/views/login_view.dart';
import 'package:mlm_crm_prototype1/app/modules/home/views/home_view.dart';
import 'package:mlm_crm_prototype1/app/modules/language_selection/views/language_selection_view.dart';
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
      Get.offAll(
        () => const LanguageSelectionView(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 400),
      );
    } else if (!isLoggedIn) {
      Get.offAll(
        () => const LoginView(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 400),
      );
    } else {
      Get.offAll(
        () => const HomeView(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 400),
      );
    }
  }
}
