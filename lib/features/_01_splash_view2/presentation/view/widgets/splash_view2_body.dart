import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import 'logo_visibility_widget.dart';

class SplashView2Body extends StatelessWidget {
  const SplashView2Body({
    super.key,
    required Animation<Offset> rAnimation,
    required bool showO,
    required Animation<Offset> oAnimation,
    required bool showA,
    required Animation<Offset> aAnimation,
    required bool showDman,
    required Animation<Offset> dmanAnimation,
    required this.showWelcomeMessage,
  }) : _rAnimation = rAnimation,
       _showO = showO,
       _oAnimation = oAnimation,
       _showA = showA,
       _aAnimation = aAnimation,
       _showDman = showDman,
       _dmanAnimation = dmanAnimation;

  final Animation<Offset> _rAnimation;
  final bool _showO;
  final Animation<Offset> _oAnimation;
  final bool _showA;
  final Animation<Offset> _aAnimation;
  final bool _showDman;
  final Animation<Offset> _dmanAnimation;
  final bool showWelcomeMessage;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: screenSize.height * .03,
        children: [
          LogoVisibilityWidget(
            rAnimation: _rAnimation,
            showO: _showO,
            oAnimation: _oAnimation,
            showA: _showA,
            aAnimation: _aAnimation,
            showDman: _showDman,
            dmanAnimation: _dmanAnimation,
          ),

          /// Welcome Message
          if (showWelcomeMessage)
            Text(
              'Your Journey Start Here 🚀🚀',
              textAlign: TextAlign.center,
              style: AfacadTextStyles.textStyle18W400Blue(
                context,
              ).copyWith(fontWeight: FontWeight.w700),
            ),
        ],
      ),
    );
  }
}
