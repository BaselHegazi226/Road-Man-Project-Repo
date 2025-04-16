import 'package:flutter/material.dart';

import '../../../../../core/helper/const_variables.dart';
import '../../../../../core/utilities/base_text_styles.dart';

class NavigationButtons extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const NavigationButtons({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.sizeOf(context).height * .005,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentPage > 0)
            TextButton(
              onPressed: onPrevious,
              child: Row(
                spacing: screenWidth * .01,
                children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    size: 16,
                    color: kAppPrimaryBlueColor,
                  ),
                  Text(
                    'Previous',
                    style: AfacadTextStyles.textStyle16W600HBlue,
                  ),
                ],
              ),
            ),
          if (currentPage >= totalPages - 2)
            TextButton(
              onPressed: onNext,
              child: Row(
                spacing: screenWidth * .01,
                children: [
                  Text('Next', style: AfacadTextStyles.textStyle16W600HBlue),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
