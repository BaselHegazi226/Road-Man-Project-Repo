import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/Assets.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/common_widgets/custom_auth_text.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/common_widgets/custom_image.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/forget_password_widgets/forget_password_input_data_section.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 24,
        children: [
          ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: .88,
              child: CustomImage(image: kForgetPasswordImage),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 58),
            child: CustomAuthText(
              text:
                  'Don’t worry! We’ll help you regain access to your account.                          Enter your registered email or phone number to reset your password',
            ),
          ),
          ForgetPasswordInputDataSection(),
        ],
      ),
    );
  }
}
