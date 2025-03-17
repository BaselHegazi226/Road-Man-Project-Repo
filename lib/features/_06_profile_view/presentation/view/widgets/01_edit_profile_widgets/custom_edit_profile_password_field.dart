import 'package:flutter/material.dart';

import '../../../../../../core/helper/class_const_functions.dart';
import '../../../../../../core/helper/const_variables.dart';

class CustomEditProfilePasswordField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? suffixIcon;
  final FocusNode? focusNode; // Added FocusNode
  final String? errorMess, labelText;
  final double suffixIconSize;
  final void Function()? suffixIconOnPressed;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;

  const CustomEditProfilePasswordField({
    super.key,
    required this.textEditingController,
    this.keyboardType = TextInputType.text,
    this.obscureText = true,
    this.onChanged,
    this.suffixIcon,
    this.focusNode,
    this.validator,
    this.errorMess,
    this.suffixIconSize = 20,
    this.onFieldSubmitted,
    this.onSaved,
    this.suffixIconOnPressed,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.only(top: 12, bottom: 16, left: 16, right: 16),
      height: 72,
      decoration: BoxDecoration(
        color: kEditProfileContainer3Color,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.transparent,
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
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
        cursorHeight: 14,
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.start,
        obscuringCharacter: '●',
        style: ConstFunctions.editProfileTextFormFieldStyle(),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.only(bottom: 8),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kEditProfileFieldBorderColor,
              width: 1.5,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kEditProfileFieldBorderColor,
              width: 1.5,
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kErrorColor, width: 1.5),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kEditProfileFieldBorderColor,
              width: 1,
            ),
          ),
          prefixIcon: const Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              Icon(Icons.key_outlined, size: 24, color: kEditProfileIconColor),
              Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: VerticalDivider(
                  thickness: 1,
                  color: kEditProfileDividerColor,
                ),
              ),
            ],
          ),
          suffixIcon: IconButton(
            padding: EdgeInsets.only(top: 8),
            icon: Icon(
              suffixIcon,
              size: suffixIconSize,
              color: kEditProfileIconColor,
            ),
            onPressed: suffixIconOnPressed ?? () {},
          ),
          labelText: labelText,
          labelStyle: ConstFunctions.editProfilePasswordFieldStyleLabelStyle(),
        ),
      ),
    );
  }
}
