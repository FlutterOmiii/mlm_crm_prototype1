import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/core/theme/app_theme.dart';
import 'app/core/theme/theme_controller.dart';
import 'app/core/localization/app_translations.dart';
import 'app/core/localization/language_controller.dart';
import 'app/core/routes/app_pages.dart';
import 'app/core/bindings/initial_binding.dart';
import 'app/core/utils/initialize_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize all global controllers and dependencies
  await initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const SellerStackApp());
}

class SellerStackApp extends StatelessWidget {
  const SellerStackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'SellerStack',
          debugShowCheckedModeBanner: false,
          translations: AppTranslations(),
          locale: Get.find<LanguageController>().currentLocale,
          fallbackLocale: const Locale('en', 'US'),
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: Get.find<ThemeController>().themeMode,
          initialBinding: InitialBinding(),
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          defaultTransition: Transition.cupertino,
          transitionDuration: const Duration(milliseconds: 300),
        );
      },
    );
  }
}
