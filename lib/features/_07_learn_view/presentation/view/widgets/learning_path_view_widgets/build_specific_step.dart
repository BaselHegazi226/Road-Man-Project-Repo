import 'package:flutter/material.dart';
import 'package:road_man_project/generated/assets.dart';

import 'learning_path_step.dart';

class BuildSpecificStep extends StatelessWidget {
  const BuildSpecificStep({
    super.key,
    required this.alignment,
    required this.onPressed,
    required this.horizontalOffset,
    required this.image,
    required this.backgroundColor,
    required this.iconColor,
    required this.shadowColor,
  });
  final Alignment alignment;
  final VoidCallback onPressed;
  final double horizontalOffset;
  final String image;
  final Color backgroundColor, iconColor, shadowColor;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return Align(
      alignment: alignment,
      child: Padding(
        padding: EdgeInsets.only(
          top: screenSize.height * .025,
          bottom: screenSize.height * .01,
          left: alignment == Alignment.centerLeft ? horizontalOffset : 0,
          right: alignment == Alignment.centerRight ? horizontalOffset : 0,
        ),
        child: LearningPathStep(
          onPressed: onPressed,
          image: image,
          iconColor: iconColor,
          backgroundColor: backgroundColor,
          shadowColor: shadowColor,
        ),
      ),
    );
  }

  Map<String, dynamic> allDataOfStep(Map<int, bool?> stateAndItem) {
    Map<String, dynamic> backValue = {
      'background_color': const Color(0xffE5E5E5),
      'shadow_color': const Color(0xffB7B7B7),
      'image': Assets.logoRImage,
    };
    switch (stateAndItem) {
      case {0: null}:
        backValue = {
          'background_color': const Color(0xff9EDA53),
          'shadow_color': const Color(0xff69A123),
          'image': Assets.learningPathFinishedStarImage,
        };
      case {0: false}:
        backValue = {
          'background_color': const Color(0xffE5E5E5),
          'shadow_color': const Color(0xffB7B7B7),
          'image': Assets.learningPathFinishedStarImage,
        };
      case {0: true}:
        backValue = {
          'background_color': const Color(0xff5385DA),
          'shadow_color': const Color(0xff2961BE),
          'image': Assets.learningPathFinishedStarImage,
        };
      case {1: false}:
        backValue = {
          'background_color': const Color(0xffE5E5E5),
          'shadow_color': const Color(0xffB7B7B7),
          'image': Assets.learningPathUnActiveLessonImage,
        };
      case {1: true}:
        backValue = {
          'background_color': const Color(0xff5385DA),
          'shadow_color': const Color(0xff2961BE),
          'image': Assets.learningPathUnActiveLessonImage,
        };
      case {2: false}:
        backValue = {
          'background_color': const Color(0xffE5E5E5),
          'shadow_color': const Color(0xffB7B7B7),
          'image': Assets.logoRImage,
        };
      case {2: true}:
        backValue = {
          'background_color': const Color(0xff5385DA),
          'shadow_color': const Color(0xff2961BE),
          'image': Assets.logoRImage,
        };
      default:
        return backValue;
    }
    return backValue;
  }
}
