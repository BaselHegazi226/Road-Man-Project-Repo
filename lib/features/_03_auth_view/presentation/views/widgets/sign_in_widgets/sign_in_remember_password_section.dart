import 'package:flutter/material.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/sign_in_remember_me_section.dart';

import '../../../../../../core/utilities/base_text_styles.dart';

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
            style: AfacadTextStyles.textStyle14W700H150Blue.copyWith(
              letterSpacing: .266,
            ),
          ),
        ),
      ],
    );
  }
}
