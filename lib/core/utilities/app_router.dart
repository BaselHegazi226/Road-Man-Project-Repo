import 'package:go_router/go_router.dart';

import '../../features/_03_auth_view/presentation/views/sign_in_view.dart';
import '../../features/_03_auth_view/presentation/views/sign_up_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SignInView()),
      GoRoute(
        path: SignInView.id,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: SignUpView.id,
        builder: (context, state) => const SignUpView(),
      ),
    ],
  );
}
