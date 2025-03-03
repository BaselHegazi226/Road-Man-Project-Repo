import 'package:flutter/material.dart';
import 'package:road_man_project/features/_04_questionnaire/presentation/widgets/questionnaire_view_body.dart';

import '../../../core/helper/class_const_functions.dart';

class QuestionnaireView extends StatelessWidget {
  const QuestionnaireView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ConstFunctions.customAppBar(
        text: '',
        onPressed: () {
        },
      ),
      body: QuestionnaireViewBody(),
    );
  }
}
