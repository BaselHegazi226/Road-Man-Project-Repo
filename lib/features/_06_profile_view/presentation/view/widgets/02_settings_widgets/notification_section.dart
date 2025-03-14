import 'package:flutter/material.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/02_settings_widgets/custom_title_switch.dart';

import 'custom_icon_title.dart';
import 'custom_settings_container.dart';

class NotificationSection extends StatelessWidget {
  const NotificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CustomIconTitle(
          iconData: Icons.notifications_outlined,
          title: 'Notification',
        ),
        CustomSettingsContainer(
          child: CustomTitleSwitch(
            title: 'Turn on/off notifications',
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
