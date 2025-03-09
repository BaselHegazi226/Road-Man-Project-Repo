import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

import '../helper/pin_themes.dart';

class CustomTextFormFieldOtpPinPut extends StatelessWidget {
  const CustomTextFormFieldOtpPinPut({
    super.key,
    this.pinCount = 4,
    required this.validator,
    this.onSubmitted,
    this.onCompleted,
  });
  final int pinCount;
  final String? Function(String?)? validator;
  final void Function(String)? onSubmitted;
  final void Function(String)? onCompleted;
  @override
  Widget build(BuildContext context) {
    return Pinput(
      mainAxisAlignment: MainAxisAlignment.center,
      separatorBuilder: (index) => SizedBox(width: 12),
      length: pinCount,
      defaultPinTheme: PinThemesPinPutOtpClass.customPinThemeFunc(context),
      disabledPinTheme: PinThemesPinPutOtpClass.customPinThemeFunc(context),
      focusedPinTheme: PinThemesPinPutOtpClass.customPinThemeFunc(
        context,
        borderColor: kAppPrimaryBlueColor,
      ),
      errorPinTheme: PinThemesPinPutOtpClass.customPinThemeFunc(
        context,
        borderColor: kErrorColor,
      ),
      pinContentAlignment: Alignment.center,
      pinAnimationType: PinAnimationType.rotation,
      validator: validator,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onSubmitted: onSubmitted,
      onCompleted: onCompleted,
    );
  }
}
//manual text form field otp

// class CustomTextFormFieldOtp extends StatelessWidget {
//   final TextEditingController textEditingController;
//   final String hintText;
//   final bool obscureText;
//   final TextInputType keyboardType;
//   final Widget? suffixIcon;
//   final Widget? prefixIcon;
//   final FocusNode? focusNode; // Added FocusNode
//   final String? Function(String?)? validator;
//   final String? errorMess;
//   final void Function(String)? onChanged;
//   final Color generalColor;
//   final Color backgroundColor;
//   // final void Function(String?)? onSaved;
//
//   const CustomTextFormFieldOtp({
//     super.key,
//     required this.hintText,
//     required this.textEditingController,
//     required this.keyboardType,
//     required this.generalColor,
//     this.backgroundColor = Colors.grey,
//     this.obscureText = false,
//     this.onChanged,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.focusNode,
//     this.validator,
//     this.errorMess,
//     // required this.onSaved,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width * .14,
//       height: MediaQuery.of(context).size.width * .15,
//       child: TextFormField(
//         onTap: () {
//           FocusScope.of(context).requestFocus(focusNode);
//         },
//         inputFormatters: [
//           LengthLimitingTextInputFormatter(1),
//           FilteringTextInputFormatter.singleLineFormatter,
//         ],
//         // onSaved: onSaved,
//         controller: textEditingController,
//         obscureText: obscureText,
//         onChanged: onChanged,
//         focusNode: focusNode, // Assigned FocusNode
//         validator: validator,
//         textInputAction: TextInputAction.next,
//         cursorColor: Colors.white,
//         cursorHeight: 48,
//         cursorOpacityAnimates: true,
//         cursorErrorColor: focusNode != null && focusNode!.hasFocus
//             ? generalColor // Change to focus color on error
//             : kErrorColor,
//         style: TextStyle(
//           color: generalColor,
//           fontWeight: FontWeight.w800,
//           fontFamily: 'cairoPlay',
//           fontSize: 48,
//         ),
//         decoration: InputDecoration(
//           suffixIcon: suffixIcon,
//           prefixIcon: prefixIcon,
//           suffixStyle: TextStyle(
//             color: generalColor,
//           ),
//           prefixStyle: TextStyle(
//             color: generalColor,
//           ),
//           hintText: hintText,
//           hintStyle: TextStyle(
//             color: generalColor,
//             fontWeight: FontWeight.w900,
//             fontFamily: 'cairo',
//           ),
//           border: outlineInputBorder(
//             borderRadius: 8,
//             color: Colors.transparent,
//           ),
//           enabledBorder: outlineInputBorder(
//             borderRadius: 4,
//             color: Colors.transparent,
//           ),
//           focusedBorder: outlineInputBorder(
//             borderRadius: 4,
//             color: generalColor, // Focus color applied here
//           ),
//           disabledBorder: outlineInputBorder(
//             borderRadius: 4,
//             color: Colors.transparent,
//           ),
//           errorBorder: outlineInputBorder(
//             borderRadius: 4,
//             color: focusNode != null && focusNode!.hasFocus
//                 ? generalColor // Change to focus color on error
//                 : kErrorColor,
//           ),
//           focusedErrorBorder: outlineInputBorder(
//             borderRadius: 4,
//             color: focusNode != null && focusNode!.hasFocus
//                 ? generalColor // Change to focus color on error
//                 : kErrorColor,
//           ),
//           errorStyle: const TextStyle(
//             fontWeight: FontWeight.w900,
//             fontSize: 16,
//             fontFamily: 'ubuntuCondensed',
//           ),
//           errorText: errorMess,
//           fillColor: backgroundColor,
//           filled: true,
//         ),
//       ),
//     );
//   }
//
//   OutlineInputBorder outlineInputBorder({
//     required double borderRadius,
//     required Color color,
//   }) {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.all(
//         Radius.circular(borderRadius),
//       ),
//       borderSide: BorderSide(
//         color: color,
//         width: 2,
//       ),
//     );
//   }
// }
