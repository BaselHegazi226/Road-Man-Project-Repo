import 'package:flutter/cupertino.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

class IconTextItemModel {
  final IconData prefixIcon;
  final String title;
  final Color iconColor, textColor;
  final Function()? onTap;
  const IconTextItemModel({
    required this.onTap,
    required this.prefixIcon,
    required this.title,
    this.iconColor = kProfileIconColor,
    this.textColor = kTextPrimaryColor,
  });
}
