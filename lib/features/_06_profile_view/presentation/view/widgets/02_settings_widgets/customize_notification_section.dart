import 'package:flutter/material.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/02_settings_widgets/custom_settings_container.dart';

import 'custom_icon_title.dart';
import 'custom_title_switch.dart';

class CustomizeNotificationSection extends StatelessWidget {
  const CustomizeNotificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        CustomIconTitle(
          iconData: Icons.switch_left_outlined,
          title: 'Customize notification',
        ),
        CustomSettingsContainer(
          child: CustomTitleSwitch(title: 'Tests', onChanged: (value) {}),
        ),
        CustomSettingsContainer(
          child: CustomTitleSwitch(title: 'Jobs', onChanged: (value) {}),
        ),
      ],
    );
  }
}
