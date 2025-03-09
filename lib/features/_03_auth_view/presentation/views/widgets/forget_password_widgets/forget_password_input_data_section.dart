import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_text_form_field.dart';
import '../../../../../../core/utilities/custom_title.dart';

class ForgetPasswordInputDataSection extends StatefulWidget {
  const ForgetPasswordInputDataSection({super.key});

  @override
  State<ForgetPasswordInputDataSection> createState() =>
      _ForgetPasswordInputDataSectionState();
}

class _ForgetPasswordInputDataSectionState
    extends State<ForgetPasswordInputDataSection> {
  TextEditingController emailEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  String? email;
  String? emailErrorMessage;

  final FocusNode emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusListenerFun();
    controllerListenerFun();
  }

  void focusListenerFun() {
    //to make the email field is focus when i press on it
    emailFocusNode.addListener(() {
      setState(() {});
    });
  }

  void controllerListenerFun() {
    //to listen to the action which happens in the email controller field
    emailEditingController.addListener(emailControllerFun);
  }

  @override
  void dispose() {
    focusDisposeFun();
    removeControlFun();
    super.dispose();
  }

  void focusDisposeFun() {
    //to terminate the focus of email field as soon as moving to any field
    emailFocusNode.dispose();
  }

  void removeControlFun() {
    emailEditingController.removeListener(emailControllerFun);
  }

  void emailControllerFun() {
    setState(() {
      emailErrorMessage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 24,
        children: [
          CustomTextFormField(
            backgroundColor: kFilledTextFormFieldColor,
            hintText: 'Email',
            textEditingController: emailEditingController,
            keyboardType: TextInputType.text,
            textColor: kTextPrimaryColor,
            prefixIcon: Icons.email_outlined,
            validator: (email) {
              String? trimmedValue = email?.trim();
              if (trimmedValue == null || trimmedValue.isEmpty) {
                return 'Please enter an email';
              } else if (!RegExp(
                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
              ).hasMatch(trimmedValue)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            onSaved: (newValue) {
              email = newValue;
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: CustomTextButton(
              onPressed: () {
                if (!_formKey.currentState!.validate()) {}
              },
              backgroundColor: kAppPrimaryBlueColor,
              child: CustomTitle(title: 'Reset Password'),
            ),
          ),
        ],
      ),
    );
  }
}
