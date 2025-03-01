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
      color = kAppPrimaryColor;
    } else {
      iconData = kDisableIconData;
      color = kDisableColor;
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

  static TextStyle hintTextFormFieldStyle() {
    return TextStyle(
      color: kTextTextFormFieldColor,
      fontWeight: FontWeight.w400,

      fontSize: 14,
      letterSpacing: -.266,
      height: 1.5,
    );
  }

  static OutlineInputBorder outlineInputBorder({
    Color color = Colors.transparent,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.transparent, width: 1.5),
    );
  }
}
