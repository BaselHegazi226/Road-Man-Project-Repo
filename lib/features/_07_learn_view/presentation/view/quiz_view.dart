import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/quiz_view_widgets/quiz_view_body.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: AppBar(
        backgroundColor: kQuizViewPrimaryColor,
        titleSpacing: screenWidth * .04,
        leading: IconButton(
          padding: EdgeInsets.only(top: screenHeight * .02),
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: screenWidth * 0.05,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: screenHeight * .02),
          child: Text(
            'Level 1 Test',
            style: AfacadTextStyles.textStyle20W500Blue,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: screenWidth * .04,
              bottom: screenHeight * .01,
            ),
            child: Row(
              spacing: screenWidth * .04,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  spacing: screenHeight * .005,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('0', style: MontserratTextStyles.textStyle16W600Black),
                    Text(
                      'Correct',
                      style: AfacadTextStyles.textStyle14W600Black,
                    ),
                  ],
                ),
                VerticalDivider(
                  color: kAppPrimaryBlackColor,
                  thickness: 1,
                  indent: 8,
                ),
                Column(
                  spacing: screenHeight * .005,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('0', style: MontserratTextStyles.textStyle16W600Black),
                    Text(
                      'INCorrect',
                      style: AfacadTextStyles.textStyle14W600Black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      body: const QuizViewBody(),
    );
  }
}
