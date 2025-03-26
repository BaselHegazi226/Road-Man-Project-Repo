import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_up_widgets/sign_up_text_form_field_section.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';
import '../sign_in_widgets/other_register_section.dart';

class SignUpInputDataSection extends StatefulWidget {
  const SignUpInputDataSection({super.key});

  @override
  State<SignUpInputDataSection> createState() => _SignUpInputDataSectionState();
}

class _SignUpInputDataSectionState extends State<SignUpInputDataSection> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Column(
      spacing: screenHeight * .025,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: screenHeight * .005),
          child: SignUpTextFormFieldSection(formKey: _formKey),
        ),
        CustomTextButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              _formKey.currentState?.save();
              // ✅ هنا يمكنك إرسال البيانات إلى السيرفر بعد التحقق منها
            }
          },
          backgroundColor: kAppPrimaryBlueColor,
          child: const CustomTitle(title: 'Sign up'),
        ),
        OtherRegisterSection(
          onTap: () {
            GoRouter.of(context).pop();
          },
          blackText: 'Already have an account? ',
          blueText: 'Login here',
        ),
      ],
    );
  }
}
