import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Global controllers (ThemeController, LanguageController) are initialized
    // in initializeApp() before the app starts.
    // This binding is kept for future module-specific dependencies.
  }
}
