import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/custom_app_bar.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/verification_widgets/verification_view_body.dart';

import '../../../../core/helper/const_variables.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        generalColor: kAppPrimaryBlueColor,
        text: 'Verification',
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      body: VerificationViewBody(),
    );
  }
}
