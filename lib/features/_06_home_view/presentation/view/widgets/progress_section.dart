import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/progress_section_widgets/left_section.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/progress_section_widgets/progress_circle.dart';

class ProgressSection extends StatelessWidget {
  const ProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        //height: screenSize.height * .165,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: kSecondlyLightWhiteColor,
          borderRadius: BorderRadius.circular(screenSize.width * .04),
          border: Border.all(width: 1, color: kAppPrimaryBlueColor),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenSize.width * .04),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left section with progress stats and button
              LeftSection(),
              // Right section with progress circle
              const ProgressCircle(),
            ],
          ),
        ),
      ),
    );
  }
}
