import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utilities/custom_text_form_field.dart';

class SignUpPasswordSection extends StatelessWidget {
  const SignUpPasswordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Password',
      textEditingController: TextEditingController(),
      prefixIcon: Icons.lock_outline,
      suffixIcon: CupertinoIcons.eye_slash,
    );
  }
}
