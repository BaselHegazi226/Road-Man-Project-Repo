import 'package:flutter/cupertino.dart';

class ProfileItemModel {
  final IconData prefixIcon;
  final String title;
  final Function()? onTap;
  const ProfileItemModel({
    required this.onTap,
    required this.prefixIcon,
    required this.title,
  });
}
