import 'package:flutter/material.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/sign_in_remember_me_section.dart';

import '../../../../../../core/helper/const_variables.dart';

class RememberMeForgetPasswordSection extends StatelessWidget {
  const RememberMeForgetPasswordSection({
    super.key,
    required this.forgetPasswordPressed,
  });
  final void Function()? forgetPasswordPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RememberMeSection(),
        TextButton(
          onPressed: forgetPasswordPressed,
          child: Text(
            maxLines: 1,
            'Forget your password ?',
            style: TextStyle(
              color: kAppPrimaryBlueColor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              letterSpacing: .266,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
