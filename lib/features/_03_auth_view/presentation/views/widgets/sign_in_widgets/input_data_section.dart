import 'package:flutter/material.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/remember_me_forget_password_section.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/text_form_fields_section.dart';

import 'button_section.dart';
import 'other_register_section.dart';

class InputDataSection extends StatelessWidget {
  const InputDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 16,
        children: [
          TextFormFieldsSection(),
          RememberMeForgetPasswordSection(),
          ButtonSection(),
          OtherRegisterSection(),
        ],
      ),
    );
  }
}
