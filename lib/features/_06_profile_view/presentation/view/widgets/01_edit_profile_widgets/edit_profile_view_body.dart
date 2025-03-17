import 'package:flutter/cupertino.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/01_edit_profile_widgets/edit_profile_image.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/01_edit_profile_widgets/edit_profile_names_fields_section.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/01_edit_profile_widgets/edit_profile_password_fields_section.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        spacing: 16,
        children: [
          EditProfileImage(),
          EditProfileNamesFieldsSection(),
          EditProfilePasswordFieldsSection(),
        ],
      ),
    );
  }
}
