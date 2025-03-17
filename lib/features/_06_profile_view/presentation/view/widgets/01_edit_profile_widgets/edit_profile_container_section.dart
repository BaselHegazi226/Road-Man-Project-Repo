import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../common_widgets/const_list.dart';
import 'custom_edit_profile_item.dart';

class EditProfileContainerSection extends StatelessWidget {
  const EditProfileContainerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomEditProfileItem(
          editProfileContainerItemModel:
              ConstList.editProfileContainerItemModelList[0],
          backgroundColor: kEditProfileContainer1Color,
          shadowColor: Colors.black.withAlpha(64),
          letterSpacing: .96,
        ),
        CustomEditProfileItem(
          editProfileContainerItemModel:
              ConstList.editProfileContainerItemModelList[1],
          backgroundColor: kEditProfileContainer2Color,
        ),
      ],
    );
  }
}
