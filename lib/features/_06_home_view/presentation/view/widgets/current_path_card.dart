import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/gradients.dart';
import '../../../../../core/helper/const_variables.dart';

class CurrentPathCard extends StatelessWidget {
  const CurrentPathCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 138,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        gradient: Gradients.currentPathGradient,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left column with text and button
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    'Current Path Name',
                    style: TextStyle(
                      color: kAppPrimaryBlueColor,
                      fontSize: 20,
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w700,
                      height: 1.50,
                      letterSpacing: -0.38,
                    ),
                  ),

                  // Subtitle
                  const SizedBox(height: 8),
                  Text(
                    'Track goal',
                    style: TextStyle(
                      color: kAppPrimaryBlackColor,
                      fontSize: 16,
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w500,
                      height: 1.50,
                      letterSpacing: 1.28,
                    ),
                  ),

                  // Spacer to push button to bottom
                  const Spacer(),

                  // View Path Button
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: ShapeDecoration(
                      color: kQuizViewWhiteColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      'View path',
                      style: TextStyle(
                        color: kAppPrimaryBlueColor,
                        fontSize: 14,
                        fontFamily: 'Afacad',
                        fontWeight: FontWeight.w500,
                        height: 1.50,
                        letterSpacing: -0.27,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),

          // Right side with decorative elements - keep this with Positioned
          SizedBox(
            width: 156,
            height: 172,
            child: Stack(
              children: [
                // Circles decoration
                Positioned(
                  left: 39,
                  top: 55,
                  child: Container(
                    width: 117,
                    height: 117,
                    decoration: ShapeDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(0.06, 0.47),
                        end: Alignment(1.05, 0.47),
                        colors: [Color(0xFF9FADFF), Color(0xFF4C89FF)],
                      ),
                      shape: const OvalBorder(),
                    ),
                  ),
                ),

                // Image (placeholder)
                Positioned(
                  left: 55,
                  bottom: 0,
                  child: Image.asset('assets/images/home/man_with_lap.png'),
                ),

                // Decoration circles
                _buildDecorativeCircle(129, 7, 20, const Color(0xFF8493EB)),
                _buildDecorativeCircle(58, 12, 10, const Color(0xFF4C89FF)),
                _buildDecorativeCircle(29, 67, 16, const Color(0xFFD1D7FF)),
                _buildDecorativeCircle(14, 28, 15, const Color(0xFF9FADFF)),
                _buildDecorativeCircle(0, 93, 8, const Color(0xFF4C89FF)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDecorativeCircle(double left, double top, double size, Color color) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: size,
        height: size,
        decoration: ShapeDecoration(
          color: color,
          shape: const OvalBorder(),
        ),
      ),
    );
  }
}