import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/utilities/custom_scaffold_widget.dart';
import 'package:road_man_project/features/_03_auth_view/data/repos/auth_repo_implement.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_up_widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return AuthBloc(authRepo: AuthRepoImplement());
      },
      child: const CustomScaffoldWidget(body: SignUpViewBody()),
    );
  }
}
