import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/features/_01_splash_view2/presentation/view/widgets/splash_view2_body.dart';

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
  late final AnimationController _rController;
  late final AnimationController _oController;
  late final AnimationController _aController;
  late final AnimationController _dmanController;

  late final Animation<Offset> _rAnimation;
  late final Animation<Offset> _oAnimation;
  late final Animation<Offset> _aAnimation;
  late final Animation<Offset> _dmanAnimation;

  bool _showO = false;
  bool _showA = false;
  bool _showDman = false;
  bool _showWelcomeMessage = false;

  @override
  void initState() {
    super.initState();

    const duration = Duration(milliseconds: 600);

    _rController = AnimationController(vsync: this, duration: duration);
    _oController = AnimationController(vsync: this, duration: duration);
    _aController = AnimationController(vsync: this, duration: duration);
    _dmanController = AnimationController(vsync: this, duration: duration);

    _rAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _rController, curve: Curves.easeOut));

    _oAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _oController, curve: Curves.easeOut));

    _aAnimation = Tween<Offset>(
      begin: const Offset(0, 1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _aController, curve: Curves.easeOut));

    _dmanAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _dmanController, curve: Curves.easeOut));

    // تسلسل الحروف
    _rController.forward().then((_) {
      setState(() => _showO = true);
      _oController.forward().then((_) {
        setState(() => _showA = true);
        _aController.forward().then((_) {
          setState(() => _showDman = true);
          _dmanController.forward().then((_) {
            setState(() => _showWelcomeMessage = true);
            BlocProvider.of<RefreshTokenCubit>(context).refreshTokenCubitFun();
          });
        });
      });
    });
  }

  @override
  void dispose() {
    _rController.dispose();
    _oController.dispose();
    _aController.dispose();
    _dmanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RefreshTokenCubit, RefreshTokenStates>(
      listener: (context, state) {
        if (state is RefreshTokenSuccess) {
          GoRouter.of(context).go(Routes.mainViewId);
        } else if (state is RefreshTokenFailure) {
          GoRouter.of(context).go(Routes.onBoardingPageViewId);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SplashView2Body(
          rAnimation: _rAnimation,
          showO: _showO,
          oAnimation: _oAnimation,
          showA: _showA,
          aAnimation: _aAnimation,
          showDman: _showDman,
          dmanAnimation: _dmanAnimation,
          showWelcomeMessage: _showWelcomeMessage,
        ),
      ),
    );
  }
}
