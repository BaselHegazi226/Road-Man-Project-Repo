import 'package:flutter/material.dart';

import '../../../../../../core/helper/class_const_functions.dart';
import '../../../../../../core/helper/const_variables.dart';

class CustomEditProfileNameField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final FocusNode? focusNode; // Added FocusNode
  final String? errorMess, labelText;
  final double textLetterSpacing;
  final Color underlineColor, fullColor, shadowColor;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;

  const CustomEditProfileNameField({
    super.key,
    required this.textEditingController,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.prefixIcon = Icons.key_outlined,
    this.underlineColor = kEditProfileFieldBorderColor,
    this.fullColor = kEditProfileContainer3Color,
    this.shadowColor = Colors.transparent,
    this.textLetterSpacing = 1,
    this.focusNode,
    this.validator,
    this.errorMess,
    this.onFieldSubmitted,
    this.onSaved,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.only(top: 12, bottom: 16, left: 16, right: 16),
      height: 72,
      decoration: BoxDecoration(
        color: fullColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
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
        style: ConstFunctions.editProfileTextStyle(
          letterSpacing: textLetterSpacing,
        ),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.only(bottom: 8),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kEditProfileFieldBorderColor,
              width: 1.5,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underlineColor, width: 1.5),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underlineColor, width: 1.5),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kErrorColor, width: 1.5),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underlineColor, width: 1.5),
          ),
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              Icon(prefixIcon, size: 24, color: kEditProfileIconColor),
              Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: VerticalDivider(
                  thickness: 1,
                  color: kEditProfileDividerColor,
                ),
              ),
            ],
          ),
          labelText: labelText,
          labelStyle: ConstFunctions.editProfilePasswordFieldStyleLabelStyle(),
        ),
      ),
    );
  }
}
