import 'package:flutter/material.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_up_widgets/sign_up_password_section.dart';

import '../../../../../../core/utilities/custom_text_form_field.dart';

class SignUPTextFormFieldSection extends StatefulWidget {
  const SignUPTextFormFieldSection({super.key});

  @override
  State<SignUPTextFormFieldSection> createState() =>
      _SignUPTextFormFieldSectionState();
}

class _SignUPTextFormFieldSectionState
    extends State<SignUPTextFormFieldSection> {
  String? name, email, password;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CustomTextFormField(
          hintText: 'Name',
          textEditingController: TextEditingController(),
          prefixIcon: Icons.person_2_outlined,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Name is required';
            }
            if (value.trim().length < 8) {
              return 'Enter at least 8 letters';
            }
            if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value.trim())) {
              return 'Enter a valid name (letters only)';
            }
            return null;
          },
          onSaved: (newValue) {
            name = newValue;
          },
        ),
        CustomTextFormField(
          hintText: 'Email',
          textEditingController: TextEditingController(),
          prefixIcon: Icons.email_outlined,
          validator: (email) {
            String? trimmedValue = email?.trim();
            if (trimmedValue == null || trimmedValue.isEmpty) {
              return 'Please enter an email';
            } else if (!RegExp(
              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
            ).hasMatch(trimmedValue)) {
              return 'Please enter a valid email';
            }
            return null;
          },
          onSaved: (newValue) {
            email = newValue!.trim();
          },
        ),
        SignUpPasswordSection(),
      ],
    );
  }
}
