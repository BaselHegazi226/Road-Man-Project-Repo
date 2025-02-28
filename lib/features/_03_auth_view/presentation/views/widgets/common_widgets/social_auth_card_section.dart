import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/common_widgets/social_auth_card.dart';

class SocialAuthCardSection extends StatelessWidget {
  const SocialAuthCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 36,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialAuthCard(iconData: FontAwesomeIcons.googlePlusG, iconSize: 32),
        SocialAuthCard(iconData: FontAwesomeIcons.facebookF),
      ],
    );
  }
}
