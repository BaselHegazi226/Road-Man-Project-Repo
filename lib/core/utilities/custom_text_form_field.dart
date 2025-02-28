import 'package:flutter/material.dart';

import '../helper/const_functions.dart';
import '../helper/const_variables.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final FocusNode? focusNode; // Added FocusNode
  final String? Function(String?)? validator;
  final String? errorMess;
  final void Function(String)? onChanged;
  final Color textColor;
  final Color backgroundColor;

  // final void Function(String?)? onSaved;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    required this.keyboardType,
    required this.textColor,
    this.backgroundColor = Colors.grey,
    this.obscureText = false,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.validator,
    this.errorMess,
    // required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * .05,
      child: TextFormField(
        onTap: () {
          FocusScope.of(context).requestFocus(focusNode);
        },
        // onSaved: onSaved,
        controller: textEditingController,
        obscureText: obscureText,
        onChanged: onChanged,
        focusNode: focusNode,
        // Assigned FocusNode
        validator: validator,
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.bottom,
        style: ConstFunctions.textTextFormFieldStyle(),
        decoration: InputDecoration(
          suffixIcon: Icon(
            suffixIcon,
            size: 24,
            color: kIconTextFormFieldColor,
          ),
          prefixIcon: Icon(
            prefixIcon,
            size: 24,
            color: kIconTextFormFieldColor,
          ),
          hintText: hintText,
          hintStyle: ConstFunctions.hintTextFormFieldStyle(),
          border: ConstFunctions.outlineInputBorder(),
          enabledBorder: ConstFunctions.outlineInputBorder(
            color: kBorderTextFormFieldColor,
          ),
          focusedBorder: ConstFunctions.outlineInputBorder(
            color: kBorderTextFormFieldColor, // Focus color applied here
          ),
          disabledBorder: ConstFunctions.outlineInputBorder(),
          errorBorder: ConstFunctions.outlineInputBorder(
            color:
                focusNode != null && focusNode!.hasFocus
                    ? kBorderTextFormFieldColor // Change to focus color on error
                    : kErrorColor,
          ),
          focusedErrorBorder: ConstFunctions.outlineInputBorder(
            color:
                focusNode != null && focusNode!.hasFocus
                    ? kBorderTextFormFieldColor // Change to focus color on error
                    : kErrorColor,
          ),
          errorStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          errorText: errorMess,
          fillColor: backgroundColor,
          filled: true,
        ),
      ),
    );
  }
}
