import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/class_const_functions.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/verification_widgets/verification_view_body.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstFunctions.customAppBar(
        text: 'Verification',
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      body: VerificationViewBody(),
    );
  }
}
