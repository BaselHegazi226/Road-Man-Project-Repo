import 'package:flutter/material.dart';

import '../../../../../../core/utilities/base_text_styles.dart';

class AuthSubTitle extends StatelessWidget {
  const AuthSubTitle({super.key, required this.subTitle});
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      subTitle,
      style: AfacadTextStyles.textStyle16W600H150Black.copyWith(
        letterSpacing: -0.304,
      ),
    );
  }
}
