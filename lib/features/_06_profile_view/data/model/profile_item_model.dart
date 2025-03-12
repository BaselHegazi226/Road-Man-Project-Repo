import 'package:flutter/cupertino.dart';

class ProfileItemModel {
  final IconData suffixIcon, prefixIcon;
  final String title;
  ProfileItemModel({
    required this.prefixIcon,
    required this.suffixIcon,
    required this.title,
  });
}
