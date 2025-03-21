import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'const_variables.dart';

class ConstFunctions {
  static Tuple2<IconData, Color> iconDataAndColorFun({
    required bool condition,
  }) {
    IconData iconData;
    Color color;
    if (condition) {
      iconData = kEnableIconData;
      color = kAppPrimaryBlueColor;
    } else {
      iconData = kDisableIconData;
      color = kCheckPasswordItemColor;
    }
    return Tuple2(iconData, color);
  }

  static DialogType dialogType({required final String type}) {
    switch (type) {
      case 'success':
        return DialogType.success;
      case 'error':
        return DialogType.error;
      case 'info':
        return DialogType.info;
      case 'infoReverse':
        return DialogType.infoReverse;
      case 'noHeader':
        return DialogType.noHeader;
      case 'question':
        return DialogType.question;
      case 'warning':
        return DialogType.warning;
      default:
        return DialogType.success;
    }
  }

  static TextStyle textTextFormFieldStyle() {
    return TextStyle(
      color: kTextTextFormFieldColor,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: .266,
      height: 1.5,
    );
  }

  static TextStyle editProfileTextFormFieldStyle() {
    return TextStyle(
      color: kTextTextFormFieldColor,
      fontWeight: FontWeight.w600,
      fontSize: 18,
      height: 1.5,
    );
  }

  static TextStyle settingsTextTextFormFieldStyle() {
    return TextStyle(
      color: kSettingsTextFormFieldColor,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    );
  }

  static TextStyle editProfilePasswordFieldStyleLabelStyle() {
    return TextStyle(
      color: kEditProfileTitleColor,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle editProfileTextStyle({double letterSpacing = 1}) {
    return TextStyle(
      color: kTextBlackPrimaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: letterSpacing,
    );
  }

  static AppBar customAppBar({
    required String text,
    required Function()? onPressed,
    Color backgroundColor = kAppPrimaryWhiteColor,
    Color generalColor = kAppPrimaryBlueColor,
    double iconSize = 20,
  }) {
    return AppBar(
      backgroundColor: backgroundColor,
      leading: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: generalColor,
          size: iconSize,
        ),
      ),
      centerTitle: true,
      title: Text(
        text,
        style: TextStyle(
          color: generalColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static TextStyle hintTextFormFieldStyle() {
    return TextStyle(
      color: kTextTextFormFieldColor,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: -.266,
      height: 1.5,
    );
  }

  static TextStyle hintEditProfilePasswordFieldStyle() {
    return TextStyle(
      color: kTextTextFormFieldColor,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.5,
    );
  }

  static TextStyle hintSettingsTextFormFieldStyle() {
    return TextStyle(
      color: kSettingsHintTextFormFieldColor,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    );
  }

  static OutlineInputBorder outlineInputBorder({
    Color color = Colors.transparent,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.transparent, width: 1),
    );
  }

  static UnderlineInputBorder underLineInputBorder({
    Color underlineColor = Colors.transparent,
  }) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: underlineColor, width: 1.5),
    );
  }
}
