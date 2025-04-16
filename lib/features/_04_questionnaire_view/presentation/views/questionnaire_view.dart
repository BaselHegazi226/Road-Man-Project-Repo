import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_04_questionnaire_view/presentation/views/widgets/questionnaire_view_body.dart';

class QuestionnaireView extends StatelessWidget {
  const QuestionnaireView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: AppBar(backgroundColor: kAppPrimaryWhiteColor, elevation: 0),
      body: const QuestionnaireViewBody(),
    );
  }
}
