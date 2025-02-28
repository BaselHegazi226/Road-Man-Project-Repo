import 'package:flutter/material.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/sign_in_component_section_body.dart';

import '../../../../../../core/helper/const_variables.dart';

class SignInComponentsSection extends StatelessWidget {
  const SignInComponentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: kSecondlyDarkWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: SignInComponentSectionBody(),
      ),
    );
  }
}
