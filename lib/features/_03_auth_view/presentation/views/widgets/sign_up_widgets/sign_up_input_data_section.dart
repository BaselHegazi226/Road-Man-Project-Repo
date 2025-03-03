import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_up_widgets/sign_up_text_form_field_section.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';
import '../sign_in_widgets/other_register_section.dart';

class SignUpInputDataSection extends StatelessWidget {
  SignUpInputDataSection({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 20,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 4),
            child: SignUPTextFormFieldSection(formKey: _formKey),
          ),
          CustomTextButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                _formKey.currentState?.save();
                // ✅ هنا يمكنك إرسال البيانات إلى السيرفر بعد التحقق منها
              }
            },
            backgroundColor: kAppPrimaryBlueColor,
            child: CustomTitle(title: 'Sign up'),
          ),
          OtherRegisterSection(
            onTap: () {
              GoRouter.of(context).pop();
            },
            blackText: 'Already have an account? ',
            blueText: 'Login here',
          ),
        ],
      ),
    );
  }
}
