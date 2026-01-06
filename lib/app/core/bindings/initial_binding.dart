import 'package:get/get.dart';
import '../theme/theme_controller.dart';
import '../localization/language_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController(), permanent: true);
    Get.put(LanguageController(), permanent: true);
  }
}
