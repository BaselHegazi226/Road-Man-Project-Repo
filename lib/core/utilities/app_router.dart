import 'package:go_router/go_router.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/forget_password_view.dart';
import 'package:road_man_project/features/_05_home_view/presentation/view/home_view.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/about_app_view.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/edit_profile_view.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/faq_view.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/privacy_policy_view.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/settings_view.dart';

import '../../features/_03_auth_view/presentation/views/sign_in_view.dart';
import '../../features/_03_auth_view/presentation/views/sign_up_view.dart';
import 'routes.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeView()),
      GoRoute(
        path: Routes.signInView,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: Routes.signUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: Routes.forgetPasswordView,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: Routes.homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: Routes.editProfileView,
        builder: (context, state) => const EditProfileView(),
      ),
      GoRoute(
        path: Routes.settingsView,
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: Routes.aboutAppView,
        builder: (context, state) => const AboutAppView(),
      ),
      GoRoute(
        path: Routes.privacyPolicyView,
        builder: (context, state) => const PrivacyPolicyView(),
      ),
      GoRoute(
        path: Routes.faqView,
        builder: (context, state) => const FAQView(),
      ),
    ],
  );
}
