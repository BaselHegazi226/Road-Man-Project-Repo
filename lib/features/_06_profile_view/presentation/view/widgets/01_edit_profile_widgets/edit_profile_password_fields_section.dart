import 'package:flutter/cupertino.dart';

import '../../../../../_03_auth_view/presentation/views/widgets/sign_up_widgets/check_password_section.dart';
import 'custom_edit_profile_password_field.dart';

class EditProfilePasswordFieldsSection extends StatelessWidget {
  const EditProfilePasswordFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CustomEditProfilePasswordField(
          textEditingController: TextEditingController(),
          labelText: 'Current password',
          suffixIcon: CupertinoIcons.eye,
        ),
        CustomEditProfilePasswordField(
          textEditingController: TextEditingController(),
          labelText: 'New password',
          suffixIcon: CupertinoIcons.eye,
        ),
        CheckPasswordSection(
          containsPassLength: false,
          containsSpecialChar: false,
          containsNumber: false,
          containsUpperCase: false,
          containsLowerCase: false,
        ),
        CustomEditProfilePasswordField(
          textEditingController: TextEditingController(),
          labelText: 'Confirm password',
          suffixIcon: CupertinoIcons.eye,
        ),
      ],
    );
  }
}
