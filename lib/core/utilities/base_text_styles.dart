import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

// Base class
abstract class BaseTextStyles {
  final String fontFamily;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final double height;

  BaseTextStyles({
    required this.fontFamily,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    this.height = 1.0,
  });

  TextStyle get textStyle {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      height: height,
    );
  }
}

//Afacad TextStyle Class
class AfacadTextStyles extends BaseTextStyles {
  AfacadTextStyles({
    required super.color,
    required super.fontSize,
    required super.fontWeight,
    super.height,
  }) : super(fontFamily: 'afacad');

  // Text Styles with Font Size 12
  static TextStyle get textStyle12W400Black {
    return AfacadTextStyles(
      color: kTextBlackPrimaryColor,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ).textStyle;
  }

  static TextStyle get textStyle12W400Grey {
    return AfacadTextStyles(
      color: kTextGreyPrimaryColor,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ).textStyle;
  }

  static TextStyle get textStyle12W500Black {
    return AfacadTextStyles(
      color: kTextBlackPrimaryColor,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ).textStyle;
  }

  static TextStyle get textStyle12W700Black {
    return AfacadTextStyles(
      color: kTextBlackPrimaryColor,
      fontSize: 12,
      fontWeight: FontWeight.w700,
    ).textStyle;
  }

  static TextStyle get textStyle12W700Color8A8C90 {
    return AfacadTextStyles(
      color: Color(0xff8A8C90),
      fontSize: 12,
      fontWeight: FontWeight.w700,
    ).textStyle;
  }

  // Text Styles with Font Size 14
  static TextStyle get textStyle14W400Black {
    return AfacadTextStyles(
      color: kTextBlackPrimaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ).textStyle;
  }

  static TextStyle get textStyle14W400Blue {
    return AfacadTextStyles(
      color: kAppPrimaryBlueColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ).textStyle;
  }

  static TextStyle get textStyle14W400H150Black {
    return AfacadTextStyles(
      color: kTextBlackPrimaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ).textStyle;
  }

  static TextStyle get textStyle14W500Black {
    return AfacadTextStyles(
      color: kTextBlackPrimaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ).textStyle;
  }

  static TextStyle get textStyle14W500White {
    return AfacadTextStyles(
      color: kSecondlyLightWhiteColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ).textStyle;
  }

  static TextStyle get textStyle14W600H150Black {
    return AfacadTextStyles(
      color: kTextBlackPrimaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.5,
    ).textStyle;
  }

  static TextStyle get textStyle14W600Blue {
    return AfacadTextStyles(
      color: kAppPrimaryBlueColor,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ).textStyle;
  }

  static TextStyle get textStyle14W700H150Blue {
    return AfacadTextStyles(
      color: kAppPrimaryBlueColor,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      height: 1.5,
    ).textStyle;
  }

  // Text Styles with Font Size 16
  static TextStyle get textStyle16W400H150Black {
    return AfacadTextStyles(
      color: kTextBlackPrimaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ).textStyle;
  }

  static TextStyle get textStyle16W400Grey {
    return AfacadTextStyles(
      color: kTextGreyPrimaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ).textStyle;
  }

  static TextStyle get textStyle16W500H150Black {
    return AfacadTextStyles(
      color: kTextBlackPrimaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ).textStyle;
  }

  static TextStyle get textStyle16W500LightWhite {
    return AfacadTextStyles(
      color: kSecondlyLightWhiteColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ).textStyle;
  }

  static TextStyle get textStyle16W500H150Blue {
    return AfacadTextStyles(
      color: kAppPrimaryBlueColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ).textStyle;
  }

  static TextStyle get textStyle16W600H150Black {
    return AfacadTextStyles(
      color: kTextBlackPrimaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.5,
    ).textStyle;
  }

  static TextStyle get textStyle16W600Grey {
    return AfacadTextStyles(
      color: kTextGreyHalfOpacityPrimaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ).textStyle;
  }

  static TextStyle get textStyle16W700Black {
    return AfacadTextStyles(
      color: kTextBlackPrimaryColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ).textStyle;
  }

  static TextStyle get textStyle16W700Blue {
    return AfacadTextStyles(
      color: kAppPrimaryBlueColor,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ).textStyle;
  }

  // Text Styles with Font Size 18
  static TextStyle get textStyle18W400Blue {
    return AfacadTextStyles(
      color: kAppPrimaryBlueColor,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ).textStyle;
  }

  // Text Styles with Font Size 20
  static TextStyle get textStyle20W400H150Black {
    return AfacadTextStyles(
      color: kTextBlackPrimaryColor,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      height: 1.5,
    ).textStyle;
  }

  static TextStyle get textStyle20W600Black {
    return AfacadTextStyles(
      color: kTextBlackPrimaryColor,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ).textStyle;
  }

  static TextStyle get textStyle20W700White {
    return AfacadTextStyles(
      color: kSecondlyLightWhiteColor,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      height: 1.5,
    ).textStyle;
  }

  static TextStyle get textStyle20W700Blue {
    return AfacadTextStyles(
      color: kAppPrimaryBlueColor,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      height: 1.5,
    ).textStyle;
  }

  // Text Styles with Font Size 24
  static TextStyle get textStyle24W500Blue {
    return AfacadTextStyles(
      color: kAppPrimaryBlueColor,
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ).textStyle;
  }

  static TextStyle get textStyle24W600Black {
    return AfacadTextStyles(
      color: kTextBlackPrimaryColor,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ).textStyle;
  }

  static TextStyle get textStyle24W600BlackB {
    return AfacadTextStyles(
      color: kTextBlackPrimaryColor,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ).textStyle;
  }

  static TextStyle get textStyle24W600Blue {
    return AfacadTextStyles(
      color: kAppPrimaryBlueColor,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ).textStyle;
  }

  static TextStyle get textStyle24W600H150Black {
    return AfacadTextStyles(
      color: kTextBlackPrimaryColor,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      height: 1.5,
    ).textStyle;
  }

  static TextStyle get textStyle24W700Black {
    return AfacadTextStyles(
      color: kTextBlackPrimaryColor,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ).textStyle;
  }
}

// Inter TextStyle Class
class InterTextStyles extends BaseTextStyles {
  InterTextStyles({
    required super.color,
    required super.fontSize,
    required super.fontWeight,
    super.height,
  }) : super(fontFamily: 'inter');

  // Text Styles with Font Size 12
  static TextStyle get textStyle12W500Black {
    return InterTextStyles(
      color: kTextBlackPrimaryColor,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ).textStyle;
  }

  static TextStyle get textStyle12W500Blue {
    return InterTextStyles(
      color: kAppPrimaryBlueColor,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ).textStyle;
  }

  static TextStyle get textStyle12W500GreyHalfOpacity {
    return InterTextStyles(
      color: kTextGreyHalfOpacityPrimaryColor,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ).textStyle;
  }

  // Text Styles with Font Size 13
  static TextStyle get textStyle13W400Black {
    return InterTextStyles(
      color: kTextGreyPrimaryColor,
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ).textStyle;
  }
}

// Jost TextStyle Class
class JostTextStyles extends BaseTextStyles {
  JostTextStyles({
    required super.color,
    required super.fontSize,
    required super.fontWeight,
    super.height,
  }) : super(fontFamily: 'jost');

  // Text Styles with Font Size 15
  static TextStyle get textStyle15W600Black {
    return JostTextStyles(
      color: kTextBlackPrimaryColor,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ).textStyle;
  }

  static TextStyle get textStyle15W600Blue {
    return JostTextStyles(
      color: kAppPrimaryBlueColor,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ).textStyle;
  }
}
