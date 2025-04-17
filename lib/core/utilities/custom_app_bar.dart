import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

import 'base_text_styles.dart';

PreferredSizeWidget customAppBar({
  required String text,
  required Function()? onPressed,
  Color backgroundColor = kAppPrimaryWhiteColor,
  Color generalColor = kTextBlackPrimaryColor,
  double? iconSize, // ✅ جعله اختياريًا ليتم حسابه تلقائيًا
}) {
  return AppBar(
    backgroundColor: backgroundColor,
    elevation: 0,
    leading: Builder(
      builder: (context) {
        double screenWidth = MediaQuery.of(context).size.width;
        double calculatedIconSize =
            iconSize ?? screenWidth * 0.05; // ✅ حساب الحجم النسبي

        return IconButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: generalColor,
            size: calculatedIconSize,
          ),
        );
      },
    ),
    centerTitle: true,
    title: Text(
      text,
      style: AfacadTextStyles.textStyle20W600Blue.copyWith(color: generalColor),
    ),
  );
}
