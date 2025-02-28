import 'package:flutter/material.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_up_widgets/sign_up_view_body.dart';

import '../../../../core/helper/const_variables.dart';

class SignUpView extends StatelessWidget {
  static String id = '/SignUpView';
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: kAppPrimaryColor, body: SignUpViewBody());
  }
}
