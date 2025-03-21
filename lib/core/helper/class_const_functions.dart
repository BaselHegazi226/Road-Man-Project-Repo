import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

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
    return AfacadTextStyles.textStyle14W400H150Black.copyWith(
      color: kTextTextFormFieldColor,
      letterSpacing: .266,
    );
  }

  static TextStyle editProfileTextFormFieldStyle() {
    return AfacadTextStyles.textStyle18W600H150Black;
  }

  static TextStyle settingsTextTextFormFieldStyle() {
    return AfacadTextStyles.textStyle16W600H150Black.copyWith(
      color: kSettingsTextFormFieldColor,
    );
  }

  static TextStyle editProfilePasswordFieldStyleLabelStyle() {
    return AfacadTextStyles.textStyle20W600Black.copyWith(
      color: kEditProfileTitleColor,
    );
  }

  static TextStyle editProfileTextStyle({double letterSpacing = 1}) {
    return AfacadTextStyles.textStyle16W600H150Black.copyWith(
      height: 1,
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
    return AfacadTextStyles.textStyle14W400H150Black.copyWith(
      color: kTextTextFormFieldColor,
      letterSpacing: -.266,
    );
  }

  static TextStyle hintEditProfilePasswordFieldStyle() {
    return AfacadTextStyles.textStyle14W400Black.copyWith(
      color: kEditProfileHintTextColor,
    );
  }

  static TextStyle hintSettingsTextFormFieldStyle() {
    return AfacadTextStyles.textStyle16W600H150Black.copyWith(
      color: kSettingsHintTextFormFieldColor,
      height: 1,
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
