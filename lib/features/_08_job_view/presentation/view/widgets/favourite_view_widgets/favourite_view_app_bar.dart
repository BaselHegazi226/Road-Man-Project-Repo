import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/base_text_styles.dart';
import '../../../../../../generated/assets.dart';

AppBar favouriteViewAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: kAppPrimaryWhiteColor,
    title: Text('Favourite', style: AfacadTextStyles.textStyle20W500Black),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        GoRouter.of(context).pop();
      },
      icon: Icon(CupertinoIcons.back, color: kEditProfileIconColor),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 16),
        child: Image.asset(
          Assets.profileProfileUserImage,
          width: 32,
          height: 32,
        ),
      ),
    ],
  );
}
