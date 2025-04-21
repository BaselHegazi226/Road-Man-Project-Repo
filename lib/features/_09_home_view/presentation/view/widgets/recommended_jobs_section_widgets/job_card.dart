import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JobCard extends StatelessWidget {
  const JobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 222,
      height: 200,
      decoration: ShapeDecoration(
        color: const Color(0xFFF8F9FB),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0xFF2352A1),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Company Logo
                SvgPicture.asset('assets/images/home/google.svg', width: 24, height: 24,),
                // Bookmark icon
                SvgPicture.asset('assets/images/home/save.svg', width: 24, height: 24,),
              ],
            ),

            // Space between top row and company info
            const SizedBox(height: 8),

            // Company and time
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Google',
                    style: TextStyle(
                      color: const Color(0xFF131314),
                      fontSize: 12,
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: '  ',
                    style: TextStyle(
                      color: const Color(0xFF131314),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: '30days ago',
                    style: TextStyle(
                      color: const Color(0xFF8A8C90),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            // Job title
            const SizedBox(height: 7),
            Text(
              'Front end Development',
              style: TextStyle(
                color: const Color(0xFF131314),
                fontSize: 16,
                fontFamily: 'Afacad',
                fontWeight: FontWeight.w600,
              ),
            ),

            // Job tags row
            const SizedBox(height: 9),
            Row(
              children: [
                // Job type tag
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFE6E8EE),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    'Full-Time',
                    style: TextStyle(
                      color: const Color(0xFF131314),
                      fontSize: 11,
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                const SizedBox(width: 5),

                // Level tag
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFE6E8EE),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    'Intermediate level',
                    style: TextStyle(
                      color: const Color(0xFF131314),
                      fontSize: 11,
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),

            // Spacer to push bottom content down
            const Spacer(),

            // Divider
            Container(
              width: 213,
              height: 1,
              color: const Color(0xFF8A8C90),
            ),

            // Bottom row - Location and Apply button
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Location
                Text(
                  'Cairo | Egypt',
                  style: TextStyle(
                    color: const Color(0xFF8A8C90),
                    fontSize: 12,
                    fontFamily: 'Afacad',
                    fontWeight: FontWeight.w400,
                  ),
                ),

                // Apply button
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF2352A1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    'Apply Now',
                    style: TextStyle(
                      color: const Color(0xFFF8F9FB),
                      fontSize: 14,
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}