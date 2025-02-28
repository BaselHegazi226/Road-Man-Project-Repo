import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_form_field.dart';

class TextFormFieldsSection extends StatelessWidget {
  const TextFormFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CustomTextFormField(
          backgroundColor: kFilledTextFormFieldColor,
          hintText: 'Email',
          textEditingController: TextEditingController(),
          keyboardType: TextInputType.text,
          textColor: kTextPrimaryColor,
          prefixIcon: Icons.email_outlined,
        ),
        CustomTextFormField(
          backgroundColor: kFilledTextFormFieldColor,
          hintText: 'Password',
          textEditingController: TextEditingController(),
          keyboardType: TextInputType.text,
          textColor: kTextPrimaryColor,
          prefixIcon: Icons.lock_outline,
        ),
      ],
    );
  }
}
