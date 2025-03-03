import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/custom_scaffold_widget.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  static String id = '/SignInView';
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWidget(body: SignInViewBody());
  }
}
