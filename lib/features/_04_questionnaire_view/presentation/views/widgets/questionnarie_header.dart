import 'package:flutter/material.dart';

import '../../../../../core/utilities/base_text_styles.dart';

// الكلاسات المنفصلة
class QuestionnaireHeader extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const QuestionnaireHeader({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: MediaQuery.sizeOf(context).height * .02,
      children: [
        Text('Lets Start..', style: AfacadTextStyles.textStyle24W700Black),
        Center(
          child: Text(
            'Page ${currentPage + 1} of $totalPages',
            textAlign: TextAlign.center,
            style: AfacadTextStyles.textStyle16W600Grey,
          ),
        ),
      ],
    );
  }
}
