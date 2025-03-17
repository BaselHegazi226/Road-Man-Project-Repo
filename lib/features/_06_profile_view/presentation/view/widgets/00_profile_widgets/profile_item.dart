import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

import '../../../../data/models/profile/icon_text_item_model.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.profileItemModel});
  final IconTextItemModel profileItemModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: profileItemModel.onTap,
      splashColor: kAppPrimaryBlueColor.withAlpha(15),
      borderRadius: BorderRadius.circular(8),
      child: ListTile(
        leading: Icon(
          profileItemModel.prefixIcon,
          size: 24,
          color: profileItemModel.iconColor,
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            profileItemModel.title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: profileItemModel.textColor,
            ),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 20,
          color: profileItemModel.iconColor,
        ),
      ),
    );
  }
}
