import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/custom_flexible_widget.dart';
import 'package:road_man_project/core/utilities/show_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../data/model/learn_path_lesson_model.dart';
import 'lesson_view_card_body.dart';

class LessonViewCard extends StatefulWidget {
  const LessonViewCard({super.key, required this.learnPathLessonModel});
  final LearnPathLessonModel learnPathLessonModel;

  @override
  State<LessonViewCard> createState() => _LessonViewCardState();
}

class _LessonViewCardState extends State<LessonViewCard> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
      width: screenWidth,
      height: screenHeight * .14,
      padding: EdgeInsets.all(screenWidth * .04),
      margin: EdgeInsets.only(bottom: screenHeight * .005),
      decoration: BoxDecoration(
        color: Color(0xffE6E8EE),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(screenWidth * .04),
          topLeft: Radius.circular(screenWidth * .04),
        ),
      ),
      child: CustomFlexibleWidget(
        child: LessonViewCardBody(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          learnPathLessonModel: widget.learnPathLessonModel,
          onPressed: () async {
            final Uri url = Uri.parse(widget.learnPathLessonModel.url);
            if (await canLaunchUrl(url)) {
              log('yes loading and will go to link source');
              await launchUrl(url, mode: LaunchMode.externalApplication);
            } else {
              if (mounted) {
                setState(() {
                  showSafeSnackBar(
                    context,
                    'unable to open link try again!',
                    kAppPrimaryWrongColor,
                  );
                });
              }
            }
          },
        ),
      ),
    );
  }
}
