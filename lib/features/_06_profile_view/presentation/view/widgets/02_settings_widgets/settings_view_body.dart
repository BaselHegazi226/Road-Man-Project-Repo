import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/custom_flexible_widget.dart';
import 'package:road_man_project/core/utilities/custom_text_button.dart';
import 'package:road_man_project/core/utilities/custom_title.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/02_settings_widgets/learning_preferences_sections.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/02_settings_widgets/notification_section.dart';

import 'customize_notification_section.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
      child: CustomFlexibleWidget(
        child: Column(
          spacing: 24,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LearningPreferencesSections(),
            const NotificationSection(),
            const CustomizeNotificationSection(),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: CustomTextButton(
                onPressed: () {},
                backgroundColor: kAppPrimaryBlueColor,
                child: CustomTitle(title: 'Update'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
