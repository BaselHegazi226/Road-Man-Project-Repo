import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/base_text_styles.dart';

AppBar jobDetailsAppbar(BuildContext context) {
  return AppBar(
    backgroundColor: kAppPrimaryBlueColor,
    leading: IconButton(
      padding: EdgeInsets.symmetric(horizontal: 16),
      onPressed: () {
        GoRouter.of(context).pop();
      },
      icon: Icon(CupertinoIcons.back, color: kSecondlyLightWhiteColor),
    ),
    actions: [
      IconButton(
        padding: EdgeInsets.symmetric(horizontal: 16),
        onPressed: () {},
        icon: Icon(Icons.menu_outlined, color: kSecondlyLightWhiteColor),
      ),
    ],
    title: Text(
      'Job Details',
      style: AfacadTextStyles.textStyle20W500LightWhite,
    ),
    centerTitle: true,
  );
}
