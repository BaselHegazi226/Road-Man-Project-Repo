import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/sign_up_view.dart';

import '../../../../../../core/helper/const_variables.dart';

class OtherRegisterSection extends StatelessWidget {
  const OtherRegisterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(SignUpView.id);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 2,
        children: [
          Text(
            'Don’t have an account? ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              letterSpacing: -.304,
              height: 1.5,
              color: kTextPrimaryColor,
            ),
          ),
          Text(
            'Sign up',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              letterSpacing: -.304,
              height: 1.5,
              color: kAppPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
