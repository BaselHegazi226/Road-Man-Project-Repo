import 'package:flutter/material.dart';

import 'suggested_jobs_item.dart';

class SuggestedJobsItemListView extends StatelessWidget {
  const SuggestedJobsItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 182,
      child: Expanded(
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SuggestedJobsItem(),
            );
          },
        ),
      ),
    );
  }
}
