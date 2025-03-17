import 'package:flutter/cupertino.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

class LogoutItemModel {
  final IconData prefixIcon;
  final String title;
  final Color iconColor, textColor;
  final String routeName;
  const LogoutItemModel({
    required this.routeName,
    required this.prefixIcon,
    required this.title,
    this.iconColor = kProfileIconColor,
    this.textColor = kTextPrimaryColor,
  });
}
