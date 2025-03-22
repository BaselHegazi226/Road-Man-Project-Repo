import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import '../../../../data/model/job_details_user_job_details_item_model.dart';

class JobDetailsUserJobDetailsItem extends StatelessWidget {
  const JobDetailsUserJobDetailsItem({
    super.key,
    required this.jobDetailsUserJobDetailsItemModel,
  });
  final JobDetailsUserJobDetailsItemModel jobDetailsUserJobDetailsItemModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffE6E8EE),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: kSecondlyLightWhiteColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                jobDetailsUserJobDetailsItemModel.iconData,
                color: kAppPrimaryBlueColor,
                size: jobDetailsUserJobDetailsItemModel.iconSize,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 6,
            children: [
              Text(
                jobDetailsUserJobDetailsItemModel.title,
                style: AfacadTextStyles.textStyle14W400Black,
              ),
              Text(
                jobDetailsUserJobDetailsItemModel.subTitle,
                style: AfacadTextStyles.textStyle14W400Blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
