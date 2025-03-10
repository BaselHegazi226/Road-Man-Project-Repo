import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
//
// class CustomTextFormFieldOtpPinPut extends StatelessWidget {
//   const CustomTextFormFieldOtpPinPut({
//     super.key,
//     this.pinCount = 4,
//     required this.validator,
//     this.onSubmitted,
//     this.onCompleted,
//   });
//   final int pinCount;
//   final String? Function(String?)? validator;
//   final void Function(String)? onSubmitted;
//   final void Function(String)? onCompleted;
//   @override
//   Widget build(BuildContext context) {
//     return Pinput(
//       mainAxisAlignment: MainAxisAlignment.center,
//       separatorBuilder: (index) => SizedBox(width: 12),
//       length: pinCount,
//       defaultPinTheme: PinThemesPinPutOtpClass.customPinThemeFunc(context),
//       disabledPinTheme: PinThemesPinPutOtpClass.customPinThemeFunc(context),
//       focusedPinTheme: PinThemesPinPutOtpClass.customPinThemeFunc(
//         context,
//         borderColor: kAppPrimaryBlueColor,
//       ),
//       errorPinTheme: PinThemesPinPutOtpClass.customPinThemeFunc(
//         context,
//         borderColor: kErrorColor,
//       ),
//       pinContentAlignment: Alignment.center,
//       pinAnimationType: PinAnimationType.rotation,
//       validator: validator,
//       pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//       showCursor: true,
//       onSubmitted: onSubmitted,
//       onCompleted: onCompleted,
//     );
//   }
// }
//manual text form field otp

class CustomTextFormFieldOtp extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final FocusNode? focusNode; // Added FocusNode
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Color generalColor;
  final Color backgroundColor;
  // final void Function(String?)? onSaved;

  const CustomTextFormFieldOtp({
    super.key,
    this.hintText = '',
    required this.textEditingController,
    this.keyboardType = TextInputType.number,
    this.generalColor = kBorderOtpFieldColor,
    this.backgroundColor = kSecondlyDarkWhiteColor,
    this.obscureText = false,
    this.onChanged,
    this.focusNode,
    this.validator,
    // required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .16,
      height: MediaQuery.sizeOf(context).width * .17,
      child: TextFormField(
        onTap: () {
          FocusScope.of(context).requestFocus(focusNode);
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.singleLineFormatter,
        ],
        // onSaved: onSaved,
        keyboardType: keyboardType,
        controller: textEditingController,
        obscureText: obscureText,
        onChanged: onChanged,
        focusNode: focusNode, // Assigned FocusNode
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '';
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        cursorColor: kCursorFieldColor,
        textAlign: TextAlign.center,
        cursorHeight: 28,
        cursorOpacityAnimates: true,
        cursorErrorColor:
            focusNode != null && focusNode!.hasFocus
                ? kErrorColor // Change to focus color on error
                : generalColor,
        style: TextStyle(
          color: generalColor,
          fontWeight: FontWeight.w400,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 24,
            color: kTextOtpFieldColor,
            fontWeight: FontWeight.w400,
          ),
          border: outlineInputBorder(
            color:
                focusNode != null && focusNode!.hasFocus
                    ? generalColor // Change to focus color on error
                    : kBorderOtpFieldColor,
          ),
          enabledBorder: outlineInputBorder(
            color:
                focusNode != null && focusNode!.hasFocus
                    ? generalColor // Change to focus color on error
                    : kBorderOtpFieldColor,
          ),
          focusedBorder: outlineInputBorder(
            color:
                focusNode != null && focusNode!.hasFocus
                    ? generalColor // Change to focus color on error
                    : kBorderOtpFieldColor,
          ),
          disabledBorder: outlineInputBorder(
            color:
                focusNode != null && focusNode!.hasFocus
                    ? generalColor // Change to focus color on error
                    : kBorderOtpFieldColor,
          ),
          errorBorder: outlineInputBorder(
            color:
                focusNode != null && focusNode!.hasFocus
                    ? generalColor // Change to focus color on error
                    : kErrorColor,
          ),
          focusedErrorBorder: outlineInputBorder(
            color:
                focusNode != null && focusNode!.hasFocus
                    ? kErrorColor // Change to focus color on error
                    : generalColor,
          ),
          errorStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            height: .3,
          ),
          fillColor: backgroundColor,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 16),
          errorText: null,
          errorMaxLines: 1,
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({
    double borderRadius = 8,
    required Color color,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      borderSide: BorderSide(color: color, width: 2),
    );
  }
}
