import 'package:flutter/material.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/notification_widgets/notification_view_body.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/notification_widgets/notifications_view_app_bar.dart';

import '../../../../core/helper/const_variables.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: notificationViewAppbar(context),
      body: const NotificationViewBody(),
    );
  }
}
