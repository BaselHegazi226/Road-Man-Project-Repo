import 'package:flutter/material.dart';
import 'package:road_man_project/features/_06_profile_view/data/models/profile/edit_profile_container_item_model.dart';

import '../../../../../../core/helper/const_variables.dart';

class CustomEditProfileItem extends StatelessWidget {
  const CustomEditProfileItem({
    super.key,
    required this.editProfileContainerItemModel,
    required this.backgroundColor,
    this.shadowColor = Colors.transparent,
    this.letterSpacing = 0,
  });
  final EditProfileContainerItemModel editProfileContainerItemModel;
  final Color backgroundColor;
  final Color shadowColor;
  final double letterSpacing;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      height: 64,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          Icon(
            editProfileContainerItemModel.iconData,
            size: 24,
            color: kIconTextFormFieldColor,
          ),
          //SizedBox(width: 8),
          VerticalDivider(color: kEditProfileDividerColor, thickness: 1),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                editProfileContainerItemModel.title,
                style: TextStyle(
                  color: kEditProfileTitleColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                editProfileContainerItemModel.subTitle,
                style: TextStyle(
                  color: kTextPrimaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: letterSpacing,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
