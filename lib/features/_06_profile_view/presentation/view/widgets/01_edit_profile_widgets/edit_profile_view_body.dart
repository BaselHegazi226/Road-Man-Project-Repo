import 'package:flutter/cupertino.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/01_edit_profile_widgets/edit_profile_image.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/01_edit_profile_widgets/edit_profile_names_fields_section.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/01_edit_profile_widgets/edit_profile_password_fields_section.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * .04,
        vertical: screenHeight * .04,
      ),
      child: Column(
        spacing: screenHeight * .02,
        children: [
          EditProfileImage(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          ),
          EditProfileNamesFieldsSection(),
          EditProfilePasswordFieldsSection(),
        ],
      ),
    );
  }
}
