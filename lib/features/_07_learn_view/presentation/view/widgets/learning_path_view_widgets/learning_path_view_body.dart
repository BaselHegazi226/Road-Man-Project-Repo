import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/generated/assets.dart';

import 'learning_path_step.dart';

class LearningPathViewBody extends StatelessWidget {
  const LearningPathViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Learning path background image
          Positioned.fill(
            child: SvgPicture.asset(
              Assets.learningPathBackgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          //learning path
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(childCount: 5, (
                  context,
                  index,
                ) {
                  final level = index;
                  final isEvenLevel = level % 2 == 0;

                  final centerStep = Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: LearningPathStep(
                        onPressed: () {},
                        iconData: CupertinoIcons.star_fill,
                        iconColor: const Color(0xff69A123),
                        backgroundColor: const Color(0xff9EDA53),
                        shadowColor: const Color(0xff69A123),
                      ),
                    ),
                  );

                  final firstOffset = screenWidth * 0.2;
                  final secondOffset = screenWidth * 0.1;

                  final sideSteps =
                      isEvenLevel
                          ? [
                            _buildSpecificStep(
                              context,
                              onPressed: () {
                                GoRouter.of(context).push(Routes.lessonViewId);
                              },
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                              alignment: Alignment.centerRight,
                              horizontalOffset: firstOffset,
                              icon: FontAwesomeIcons.bookOpen,
                              backgroundColor: const Color(0xff5385DA),
                              iconColor: Colors.white54,
                              shadowColor: const Color(0xff2961BE),
                            ),
                            _buildSpecificStep(
                              context,
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                              onPressed: () {
                                GoRouter.of(context).push(Routes.quizViewId);
                              },
                              alignment: Alignment.centerRight,
                              horizontalOffset: secondOffset,
                              icon: Icons.assignment_turned_in,
                              backgroundColor: const Color(0xffE5E5E5),
                              iconColor: const Color(0xffB7B7B7),
                              shadowColor: const Color(0xffB7B7B7),
                            ),
                          ]
                          : [
                            _buildSpecificStep(
                              context,
                              onPressed: () {
                                GoRouter.of(context).push(Routes.lessonViewId);
                              },
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                              alignment: Alignment.centerLeft,
                              horizontalOffset: firstOffset,
                              icon: FontAwesomeIcons.bookOpen,
                              backgroundColor: const Color(0xff5385DA),
                              iconColor: Colors.white54,
                              shadowColor: const Color(0xff2961BE),
                            ),
                            _buildSpecificStep(
                              context,
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                              onPressed: () {
                                GoRouter.of(context).push(Routes.quizViewId);
                              },
                              alignment: Alignment.centerLeft,
                              horizontalOffset: secondOffset,
                              icon: Icons.assignment_turned_in,
                              backgroundColor: const Color(0xffE5E5E5),
                              iconColor: const Color(0xffB7B7B7),
                              shadowColor: const Color(0xffB7B7B7),
                            ),
                          ];

                  return Column(children: [centerStep, ...sideSteps]);
                }),
              ),
              SliverToBoxAdapter(child: SizedBox(height: screenHeight * .0625)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSpecificStep(
    context, {
    required double screenWidth,
    required double screenHeight,
    required VoidCallback onPressed,
    required Alignment alignment,
    required double horizontalOffset,
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
    required Color shadowColor,
  }) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * .025,
          bottom: screenHeight * .01,
          left: alignment == Alignment.centerLeft ? horizontalOffset : 0,
          right: alignment == Alignment.centerRight ? horizontalOffset : 0,
        ),
        child: LearningPathStep(
          onPressed: onPressed,
          iconData: icon,
          iconColor: iconColor,
          backgroundColor: backgroundColor,
          shadowColor: shadowColor,
        ),
      ),
    );
  }
}

/*
                _buildSpecificStep(
                              context,
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                              onPressed: (){
                                GoRouter.of(context).push(Routes.lessonViewId)
                              },
                              alignment: Alignment.centerRight,
                              horizontalOffset: firstOffset,
                              icon: FontAwesomeIcons.bookOpen,
                              backgroundColor: const Color(0xff5385DA),
                              iconColor: Colors.white54,
                              shadowColor: const Color(0xff2961BE),
                            ),
                            _buildSpecificStep(
                              context,
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                              onPressed: (){
                                GoRouter.of(context).push(Routes.quizViewId)
                              },
                              alignment: Alignment.centerRight,
                              horizontalOffset: secondOffset,
                              icon: Icons.assignment_turned_in,
                              backgroundColor: const Color(0xffE5E5E5),
                              iconColor: const Color(0xffB7B7B7),
                              shadowColor: const Color(0xffB7B7B7),
                            ),

 */
