import 'package:flutter/material.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/notification_widgets/notification_const_list.dart';

import 'notification_view_day_text.dart';
import 'notification_view_item.dart';

class NotificationDaySection extends StatelessWidget {
  const NotificationDaySection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final DateTime currentDate = DateTime.now().subtract(
            Duration(days: index),
          );
          final String dayText = _formatDayText(currentDate, index);

          return Padding(
            padding: EdgeInsets.only(bottom: screenHeight * .02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: screenHeight * .02,
              children: [
                NotificationViewDayText(
                  dayText: dayText,
                  dateTime: currentDate,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics:
                      NeverScrollableScrollPhysics(), // تعطيل التمرير داخل القائمة الداخلية
                  itemCount:
                      NotificationConstList
                          .notificationViewItemModelList
                          .length,
                  itemBuilder: (context, itemIndex) {
                    final list =
                        NotificationConstList.notificationViewItemModelList;
                    return Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * .015),
                      child: NotificationViewItem(
                        notificationViewItemModel: list[itemIndex],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
        childCount: 7, // عرض الإشعارات لآخر 7 أيام
      ),
    );
  }

  String _formatDayText(DateTime date, int index) {
    if (index == 0) return "Today";
    if (index == 1) return "Yesterday";
    return "${date.day}/${date.month}/${date.year}";
  }
}
