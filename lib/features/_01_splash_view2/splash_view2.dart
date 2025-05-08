import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/generated/assets.dart';

import '../../core/utilities/routes.dart';
import '../_03_auth_view/presentation/view_model/refresh_token_cubit/refresh_token_cubit.dart';
import '../_03_auth_view/presentation/view_model/refresh_token_cubit/refresh_token_state.dart';

class SplashView2 extends StatefulWidget {
  const SplashView2({super.key});

  @override
  State<SplashView2> createState() => _SplashView2State();
}

class _SplashView2State extends State<SplashView2>
    with TickerProviderStateMixin {
  late AnimationController _rightTextController;
  late AnimationController _leftImageController;
  late Animation<Offset> _rightTextAnimation;
  late Animation<Offset> _leftImageAnimation;

  @override
  void initState() {
    super.initState();

    _rightTextController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    );

    _leftImageController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    );

    _rightTextAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _rightTextController,
        curve: Curves.easeInOutCubicEmphasized,
      ),
    );

    _leftImageAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _leftImageController,
        curve: Curves.easeInOutCubicEmphasized,
      ),
    );

    _leftImageController.forward();
    _rightTextController.forward().then((_) {
      BlocProvider.of<RefreshTokenCubit>(context).refreshTokenCubitFun();
    });
  }

  @override
  void dispose() {
    _rightTextController.dispose();
    _leftImageController.dispose();
    super.dispose();
  }

  void navigateBasedOnState(RefreshTokenStates state) {
    if (state is RefreshTokenSuccess) {
      GoRouter.of(context).go(Routes.mainViewId);
    } else if (state is RefreshTokenFailure) {
      GoRouter.of(context).go(Routes.onBoardingPageViewId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RefreshTokenCubit, RefreshTokenStates>(
      listener: (context, state) {
        navigateBasedOnState(state);
      },
      child: Scaffold(
        backgroundColor: kAppPrimaryWhiteColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Stack لعرض الصور والشعار المتحرك
            Stack(
              alignment: Alignment.center,
              children: [
                SlideTransition(
                  position: _leftImageAnimation,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(Assets.roadManLogoWithoutTextImage),
                  ),
                ),
                SlideTransition(
                  position: _rightTextAnimation,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(Assets.roadManTextImage),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
