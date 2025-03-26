import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/custom_scaffold_widget.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_up_widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffoldWidget(body: SignUpViewBody());
  }
}
