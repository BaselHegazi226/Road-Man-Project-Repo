import 'package:go_router/go_router.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/forget_password_view.dart';
import 'package:road_man_project/features/_05_home_view/presentation/view/home_view.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/about_app_view.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/edit_profile_view.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/faq_view.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/privacy_policy_view.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/settings_view.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/job_details_view.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/job_view.dart';

import '../../features/_03_auth_view/presentation/views/sign_in_view.dart';
import '../../features/_03_auth_view/presentation/views/sign_up_view.dart';
import 'routes.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeView()),
      GoRoute(
        path: Routes.signInViewId,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: Routes.signUpViewId,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: Routes.forgetPasswordViewId,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: Routes.homeViewId,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: Routes.profileViewId,
        builder: (context, state) => const FAQView(),
      ),
      GoRoute(
        path: Routes.editProfileViewId,
        builder: (context, state) => const EditProfileView(),
      ),
      GoRoute(
        path: Routes.settingsViewId,
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: Routes.aboutAppViewId,
        builder: (context, state) => const AboutAppView(),
      ),
      GoRoute(
        path: Routes.privacyPolicyViewId,
        builder: (context, state) => const PrivacyPolicyView(),
      ),
      GoRoute(
        path: Routes.faqViewId,
        builder: (context, state) => const FAQView(),
      ),
      GoRoute(
        path: Routes.jobViewId,
        builder: (context, state) => const JobView(),
      ),
      GoRoute(
        path: Routes.jobDetailsViewId,
        builder: (context, state) => const JobDetailsView(),
      ),
    ],
  );
}
