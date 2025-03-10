import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/utilities/custom_text_form_field_otp.dart';

class VerificationOtpFields extends StatefulWidget {
  const VerificationOtpFields({
    super.key,
    required this.formKey,
    required this.autoValidateMode,
  });
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autoValidateMode;

  @override
  State<VerificationOtpFields> createState() => _VerificationOtpFieldsState();
}

class _VerificationOtpFieldsState extends State<VerificationOtpFields> {
  List<TextEditingController> otpControllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  List<FocusNode> otpFocusNodes = List.generate(4, (index) => FocusNode());

  String? errorMessage;

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in otpFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onOtpChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < otpControllers.length - 1) {
        FocusScope.of(context).requestFocus(otpFocusNodes[index + 1]);
      } else {
        otpFocusNodes[index].unfocus();
      }
    }
  }

  void _onPaste(String value) {
    if (value.length == otpControllers.length) {
      for (int i = 0; i < otpControllers.length; i++) {
        otpControllers[i].text = value[i];
      }
      otpFocusNodes.last.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidateMode: widget.autoValidateMode,
      child: Column(
        children: [
          GestureDetector(
            onLongPress: () async {
              ClipboardData? clipboardData = await Clipboard.getData(
                Clipboard.kTextPlain,
              );
              if (clipboardData != null) {
                _onPaste(clipboardData.text ?? '');
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                otpControllers.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CustomTextFormFieldOtp(
                    textEditingController: otpControllers[index],
                    focusNode: otpFocusNodes[index],
                    onChanged: (value) => _onOtpChanged(value, index),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
