import 'package:flutter/material.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/sign_in_remember_me_card.dart';

import '../../../../../../core/helper/const_variables.dart';

class RememberMeSection extends StatelessWidget {
  const RememberMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        RememberMeCard(),
        Text(
          maxLines: 1,
          'Remember me',
          style: TextStyle(
            color: kTextPrimaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: -.266,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
