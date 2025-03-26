import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/common_widgets/social_auth_card.dart';

class SocialAuthCardSection extends StatelessWidget {
  const SocialAuthCardSection({
    super.key,
    required this.onPressed1,
    required this.onPressed2,
  });
  final void Function()? onPressed1;
  final void Function()? onPressed2;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Row(
      spacing: screenWidth * .09,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialAuthCard(
          onPressed: onPressed1,
          iconData: FontAwesomeIcons.googlePlusG,
        ),
        SocialAuthCard(
          onPressed: onPressed2,
          iconData: FontAwesomeIcons.linkedinIn,
        ),
      ],
    );
  }
}
