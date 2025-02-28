import 'package:go_router/go_router.dart';

import '../../features/_03_auth_view/presentation/views/sign_in_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SignInView()),
      //   GoRoute(
      //     path: AuthView.id,
      //     builder: (context, state) => const AuthView(),
      //   ),
      //   GoRoute(
      //     path: SignInView.id,
      //     builder: (context, state) => const SignInView(),
      //   ),
      //   GoRoute(
      //     path: SignUpView.id,
      //     builder: (context, state) => const SignUpView(),
      //   ),
      //   GoRoute(
      //     path: ForgetPasswordView.id,
      //     builder: (context, state) => const ForgetPasswordView(),
      //   ),
      //   GoRoute(
      //     path: HomeView.id,
      //     builder: (context, state) => const HomeView(),
      //   ),
      //   GoRoute(
      //     path: VerifyEmailView.id,
      //     builder: (context, state) => const VerifyEmailView(),
      //   ),
      //   GoRoute(
      //     path: SignInPhoneNumView.id,
      //     builder: (context, state) => const SignInPhoneNumView(),
      //   ),
      //   GoRoute(
      //     path: OtpView.id,
      //     builder: (context, state) => const OtpView(),
      //   ),
    ],
  );
}
