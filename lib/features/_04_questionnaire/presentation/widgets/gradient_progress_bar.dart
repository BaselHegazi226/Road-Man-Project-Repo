import 'package:flutter/material.dart';

import '../../../../core/utilities/gradients.dart';

class GradientProgressBar extends StatelessWidget {
  final double progress; // Value between 0.0 and 1.0 (0% to 100%)
  final double height;
  final BorderRadius borderRadius;
  final double horizontalPadding;

  const GradientProgressBar({
    Key? key,
    required this.progress,
    this.height = 8.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
    this.horizontalPadding = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: const Color(0xFFE6E8EE), // Under progress color #E6E8EE
      ),
      child: Row(
        children: [
          Container(
            width: (MediaQuery.of(context).size.width - 2 * horizontalPadding) * progress.clamp(0.0, 1.0),
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              gradient: Gradients.blueLinearGradient,
            ),
          ),
        ],
      ),
    );
  }
}