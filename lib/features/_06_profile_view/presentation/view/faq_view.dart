import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/05_faq_widgets/faq_view_body.dart';

import '../../../../core/helper/class_const_functions.dart';
import '../../../../core/helper/const_variables.dart';

class FAQView extends StatelessWidget {
  const FAQView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: ConstFunctions.customAppBar(
        backgroundColor: kAppPrimaryWhiteColor,
        generalColor: kTextPrimaryColor,
        text: 'FAQ',
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      body: FaqViewBody(),
    );
  }
}
