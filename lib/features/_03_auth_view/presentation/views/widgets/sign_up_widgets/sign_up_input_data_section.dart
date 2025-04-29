import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/custom_circle_indicator.dart';
import 'package:road_man_project/core/utilities/dialogState.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_event.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_state.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_up_widgets/sign_up_text_form_field_section.dart';
import 'package:road_man_project/generated/assets.dart';

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
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Column(
      spacing: screenHeight * .025,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: screenHeight * .005),
          child: SignUpTextFormFieldSection(
            formKey: _formKey,
            nameController: nameController,
            emailController: emailController,
            passwordController: passwordController,
          ),
        ),
        BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              customAwesomeDialog(
                context: context,
                isSuccess: true,
                title: 'Sign Up Success',
                description:
                    'You have successfully sign up to Road Man. Enjoy exploring all the features available to you',
                onPressed: () {
                  GoRouter.of(context).push(Routes.mainViewId);
                },
              );
            } else if (state is SignUpFailure) {
              customAwesomeDialog(
                context: context,
                isSuccess: false,
                title: 'Sign Up Failure',
                description:
                    'There was an issue with your registration. Please check your details and try again. If the problem persists, contact support',
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              );
            } else {}
          },
          builder: (context, state) {
            return CustomTextButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _formKey.currentState?.save();
                  // ✅ هنا يمكنك إرسال البيانات إلى السيرفر بعد التحقق منها
                  context.read<AuthBloc>().add(
                    SignUpEvent(
                      name: nameController.text.trim(),
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                      image: Assets.googleImage,
                      dateTime: DateTime.now(),
                    ),
                  );
                }
              },
              backgroundColor: kAppPrimaryBlueColor,
              child:
                  state is SignUpLoading
                      ? const CustomCircleIndicator()
                      : const CustomTitle(title: 'Sign up'),
            );
          },
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
