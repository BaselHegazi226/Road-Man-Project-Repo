import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utilities/custom_text_form_field.dart';

class ResetPassFieldsSection extends StatelessWidget {
  const ResetPassFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CustomTextFormField(
          hintText: 'New Password',
          prefixIcon: Icons.lock_outline,
          suffixIcon: CupertinoIcons.eye_slash,
          textEditingController: TextEditingController(),
        ),
        CustomTextFormField(
          hintText: 'Confirm Password',
          prefixIcon: Icons.lock_outline,
          suffixIcon: CupertinoIcons.eye_slash,
          textEditingController: TextEditingController(),
        ),
      ],
    );
  }
}
