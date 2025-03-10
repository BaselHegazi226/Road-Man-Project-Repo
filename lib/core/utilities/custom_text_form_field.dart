import 'package:flutter/material.dart';

import '../helper/class_const_functions.dart';
import '../helper/const_variables.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final FocusNode? focusNode; // Added FocusNode
  final String? errorMess;
  final Color textColor;
  final Color backgroundColor;
  final double suffixIconSize;
  final double prefixIconSize;
  final void Function()? suffixIconOnPressed;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    this.keyboardType = TextInputType.text,
    this.textColor = kTextPrimaryColor,
    this.backgroundColor = kFilledTextFormFieldColor,
    this.obscureText = false,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.validator,
    this.errorMess,
    this.prefixIconSize = 24,
    this.suffixIconSize = 24,
    this.onFieldSubmitted,
    this.onSaved,
    this.suffixIconOnPressed,
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
        onSaved: onSaved,
        onChanged: onChanged,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        controller: textEditingController,
        obscureText: obscureText,
        focusNode: focusNode,
        cursorColor: kCursorFieldColor,
        // Assigned FocusNode
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.bottom,
        style: ConstFunctions.textTextFormFieldStyle(),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              suffixIcon,
              size: suffixIconSize,
              color: kIconTextFormFieldColor,
            ),
            onPressed: suffixIconOnPressed ?? () {},
          ),
          prefixIcon: Icon(
            prefixIcon,
            size: prefixIconSize,
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
            fontSize: 12,
          ),
          errorText: errorMess,
          fillColor: backgroundColor,
          filled: true,
        ),
      ),
    );
  }
}
