import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

import 'custom_edit_profile_name_field.dart';

class EditProfileNamesFieldsSection extends StatelessWidget {
  const EditProfileNamesFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomEditProfileNameField(
          textEditingController: TextEditingController(),
          prefixIcon: Icons.person_outline_outlined,
          underlineColor: Colors.transparent,
          fullColor: kEditProfileContainer1Color,
          shadowColor: Colors.grey.withAlpha(127),
          labelText: 'Full Name',
          textLetterSpacing: .96,
        ),
        CustomEditProfileNameField(
          textEditingController: TextEditingController(),
          underlineColor: Colors.transparent,
          prefixIcon: Icons.email_outlined,
          labelText: 'Email',
        ),
      ],
    );
  }
}
