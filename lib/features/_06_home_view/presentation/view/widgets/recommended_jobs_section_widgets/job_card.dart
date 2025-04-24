import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';
import 'package:road_man_project/generated/assets.dart';

import 'apply_button.dart';
import 'job_description.dart';
import 'job_tag.dart';

class JobCard extends StatelessWidget {
  const JobCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return Container(
      width: screenSize.width * 0.565, // 55% of screen width
      height: screenSize.height * 0.22, // 22% of screen height
      decoration: BoxDecoration(
        color: kSecondlyLightWhiteColor,
        borderRadius: BorderRadius.circular(
          screenSize.width * 0.04,
        ), // 4% of sc
        border: Border.all(width: 1, color: Color(0xFF2352A1)),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.02), // 2% of screen width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Company Logo
                SvgPicture.asset(
                  Assets.googleImage,
                  width: screenSize.width * 0.08, // 6% of screen width
                  height: screenSize.width * 0.08, // 6% of screen width
                ),
                // Bookmark icon
                Icon(
                  CupertinoIcons.heart,
                  size: screenSize.width * .06,
                  color: kAppPrimaryBlackColor,
                ),
              ],
            ),

            // Space between top row and company info
            SizedBox(height: screenSize.height * 0.01), // 1% of screen height
            // Company and time
            Row(
              spacing: screenSize.width * .01,
              children: [
                Text(
                  'Google',
                  style: AfacadTextStyles.textStyle12W700Black(context),
                ),
                Text(
                  '30 days ago',
                  style: InterTextStyles.textStyle12W400GreyHalfOpacity(
                    context: context,
                  ),
                ),
              ],
            ),

            // Job title
            SizedBox(height: screenSize.height * 0.01), // 1% of screen height
            JobDescription(description: 'Front end Development'),

            // Job tags row
            SizedBox(
              height: screenSize.height * 0.015,
            ), // 1.5% of screen height
            Row(
              spacing: screenSize.width * 0.02,
              children: [
                // Job type tag
                JobTag(tag: 'Full-Time'),
                // Level tag
                JobTag(tag: 'Intermediate level'),
              ],
            ),
            SizedBox(height: screenSize.height * .03),
            // Divider
            Divider(height: 1, color: Color(0xff8A8C90)),

            // Bottom row - Location and Apply button
            SizedBox(height: screenSize.height * 0.02), // 1.5% of screen height
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Location
                Text(
                  'Cairo | Egypt',
                  style: AfacadTextStyles.textStyle14W400Grey(context),
                ),
                ApplyButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
