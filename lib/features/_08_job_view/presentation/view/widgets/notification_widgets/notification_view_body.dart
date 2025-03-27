import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'notification_day_section.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: screenHeight * .02)),
          const NotificationDaySection(),
        ],
      ),
    );
  }
}
