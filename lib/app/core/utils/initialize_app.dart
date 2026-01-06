import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../theme/theme_controller.dart';
import '../localization/language_controller.dart';

/// Initialize all global controllers and dependencies
/// This must be called before the app starts
Future<void> initializeApp() async {
  // Initialize GetStorage
  await GetStorage.init();

  // Initialize global controllers
  Get.put(ThemeController(), permanent: true);
  Get.put(LanguageController(), permanent: true);
}
