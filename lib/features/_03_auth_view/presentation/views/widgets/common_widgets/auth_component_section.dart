import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/custom_flexible_widget.dart';

import '../../../../../../core/helper/const_variables.dart';
import 'auth_title.dart';

class AuthComponentSection extends StatelessWidget {
  const AuthComponentSection({
    super.key,
    required this.title,
    required this.child,
  });
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: kSecondlyDarkWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: AuthTitle(title: title),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: kSecondlyLightWhiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: CustomFlexibleWidget(child: child),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
