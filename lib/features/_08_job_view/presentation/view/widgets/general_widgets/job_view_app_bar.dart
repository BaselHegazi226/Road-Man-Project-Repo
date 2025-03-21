import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';

AppBar jobViewAppbar() {
  return AppBar(
    backgroundColor: Color(0xffF4F5F8),
    leading: IconButton(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      icon: const Icon(Icons.menu_outlined, color: kTextPrimaryColor, size: 24),
      onPressed: () {},
    ),
    actions: [
      IconButton(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        icon: const Icon(
          Icons.notifications_outlined,
          color: kTextPrimaryColor,
          size: 24,
        ),
        onPressed: () {},
      ),
    ],
  );
}
