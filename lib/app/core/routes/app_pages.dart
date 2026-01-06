import 'package:get/get.dart';
import 'app_routes.dart';
import '../../modules/splash/views/splash_view.dart';
import '../../modules/splash/bindings/splash_binding.dart';
import '../../modules/language_selection/views/language_selection_view.dart';
import '../../modules/language_selection/bindings/language_selection_binding.dart';
import '../../modules/auth/views/login_view.dart';
import '../../modules/auth/views/otp_verification_view.dart';
import '../../modules/auth/bindings/auth_binding.dart';
import '../../modules/home/views/home_view.dart';
import '../../modules/home/bindings/home_binding.dart';
import '../../modules/leads/views/leads_view.dart';
import '../../modules/leads/views/lead_details_view.dart';
import '../../modules/leads/views/add_lead_view.dart';
import '../../modules/leads/bindings/leads_binding.dart';
import '../../modules/followups/views/followups_view.dart';
import '../../modules/followups/views/add_followup_view.dart';
import '../../modules/followups/bindings/followups_binding.dart';
import '../../modules/training/views/training_view.dart';
import '../../modules/training/bindings/training_binding.dart';
import '../../modules/profile/views/profile_view.dart';
import '../../modules/profile/views/settings_view.dart';
import '../../modules/profile/views/edit_profile_view.dart';
import '../../modules/profile/bindings/profile_binding.dart';

class AppPages {
  AppPages._();

  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.languageSelection,
      page: () => const LanguageSelectionView(),
      binding: LanguageSelectionBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.otpVerification,
      page: () => const OtpVerificationView(),
      binding: AuthBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.leads,
      page: () => const LeadsView(),
      binding: LeadsBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: AppRoutes.leadDetails,
      page: () => const LeadDetailsView(),
      binding: LeadsBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: AppRoutes.addLead,
      page: () => const AddLeadView(),
      binding: LeadsBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.followups,
      page: () => const FollowupsView(),
      binding: FollowupsBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: AppRoutes.addFollowup,
      page: () => const AddFollowupView(),
      binding: FollowupsBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.training,
      page: () => const TrainingView(),
      binding: TrainingBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsView(),
      binding: ProfileBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfileView(),
      binding: ProfileBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
  ];
}
