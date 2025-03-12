import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_06_profile_view/data/model/profile_item_model.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.profileItemModel});
  final ProfileItemModel profileItemModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        profileItemModel.prefixIcon,
        size: 24,
        color: kProfileIconColor,
      ),
      title: Padding(
        padding: EdgeInsets.only(left: 8),
        child: Text(
          profileItemModel.title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: kTextPrimaryColor,
          ),
        ),
      ),
      trailing: Icon(
        profileItemModel.suffixIcon,
        size: 24,
        color: kProfileIconColor,
      ),
    );
  }
}
