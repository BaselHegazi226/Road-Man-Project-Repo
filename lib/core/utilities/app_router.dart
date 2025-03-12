import 'package:go_router/go_router.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/forget_password_view.dart';

import '../../features/_03_auth_view/presentation/views/sign_in_view.dart';
import '../../features/_03_auth_view/presentation/views/sign_up_view.dart';
import '../../features/_04_questionnaire/presentation/questionnaire_view.dart';
import 'routes.dart';


abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SignInView()),
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
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: Routes.questionnaireView,
        builder: (context, state) => const QuestionnaireView(),
      ),
    ],
  );
}
