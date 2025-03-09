import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/Assets.dart';
import 'package:road_man_project/core/utilities/custom_flexible_widget.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/common_widgets/custom_auth_text.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/reset_password_widgets/reset_password_input_data_section.dart';

import '../common_widgets/custom_image.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFlexibleWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 32,
          children: [
            CustomImage(imageBottomPadding: 21, image: kResetPasswordImage),
            CustomAuthText(
              text:
                  'Create a new password for your account.                                                    Make sure to choose a strong and secure password',
            ),
            ResetPasswordInputDataSection(),
          ],
        ),
      ),
    );
  }
}
