import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_05_main_view/presentation/view/widgets/main_view_widget/custom_bottom_nav_bar.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/learning_path_view.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/job_view.dart';

import '../../../_06_home_view/home_view.dart';
import '../../../_09_profile_view/presentation/view/profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<MainView> {
  int currentIndex = 0;

  final List<Widget> views = const [
    HomeView(),
    LearningPathView(),
    JobView(),
    ProfileView2(),
  ];

  void onTabSelected(int index) {
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      body: views[currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: onTabSelected,
      ),
    );
  }
}

//another nav bar
//google nav bar
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:road_man_project/core/helper/const_variables.dart';
// import 'package:road_man_project/features/_09_profile_view/presentation/view/profile_view.dart';
// import 'package:road_man_project/features/_07_learn_view/presentation/view/learning_path_view.dart';
//
// import '../../../../../_08_job_view/presentation/view/job_view.dart';
//
// class HomeViewBody extends StatefulWidget {
//   const HomeViewBody({super.key});
//
//   @override
//   State<HomeViewBody> createState() => _HomeViewBodyState();
// }
//
// class _HomeViewBodyState extends State<HomeViewBody> {
//   int currentIndex = 0;
//
//   final List<Widget> views = const [
//     Center(child: Text('Home', style: TextStyle(fontSize: 24))),
//     LearningPathView(),
//     JobView(),
//     ProfileView(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kAppPrimaryWhiteColor,
//       body: views[currentIndex],
//       bottomNavigationBar: SizedBox(
//         height: 80,
//         child: GNav(
//           selectedIndex: currentIndex,
//           onTabChange: (index) {
//             setState(() {
//               currentIndex = index;
//             });
//           },
//           backgroundColor: kAppPrimaryBlueColor,
//           tabBorderRadius: 16,
//           duration: const Duration(milliseconds: 600),
//           gap: 8,
//           color: kAppPrimaryWhiteColor,
//           activeColor: kAppPrimaryBlueColor,
//           iconSize: 24,
//           tabBackgroundColor: kAppPrimaryWhiteColor,
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//           tabs: List.generate(4, (index) {
//             final isSelected = currentIndex == index;
//             return GButton(
//               icon: _getIcon(index, isSelected),
//               text: _getText(index),
//             );
//           }),
//         ),
//       ),
//     );
//   }
//
//   String _getText(int index) {
//     switch (index) {
//       case 0:
//         return "Home";
//       case 1:
//         return "Learn";
//       case 2:
//         return "Job";
//       case 3:
//         return "Profile";
//       default:
//         return "";
//     }
//   }
//
//   IconData _getIcon(int index, bool isSelected) {
//     switch (index) {
//       case 0:
//         return isSelected ? Icons.home : Icons.home_outlined;
//       case 1:
//         return isSelected ? Icons.local_library : Icons.local_library_outlined;
//       case 2:
//         return isSelected ? Icons.work : Icons.work_outline;
//       case 3:
//         return isSelected ? Icons.person : Icons.person_outline;
//       default:
//         return Icons.help_outline;
//     }
//   }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class HomeViewBody extends StatefulWidget {
//   const HomeViewBody({super.key});
//
//   @override
//   State<HomeViewBody> createState() => _HomeViewBodyState();
// }
//
// class _HomeViewBodyState extends State<HomeViewBody> {
//   int currentIndex = 0;
//
//   final List<Widget> views = const [
//     Center(child: Text('Home', style: TextStyle(fontSize: 24))),
//     Center(child: Text('Learn')),
//     Center(child: Text('Jobs')),
//     Center(child: Text('Profile')),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final whiteLineHeight = screenWidth * 0.04;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: views[currentIndex],
//       bottomNavigationBar: Container(
//         color: Colors.blue.shade700,
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: List.generate(4, (index) {
//             final isSelected = currentIndex == index;
//             return GestureDetector(
//               onTap: () => setState(() => currentIndex = index),
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 width: isSelected ? screenWidth * 0.28 : screenWidth * 0.1,
//                 padding: EdgeInsets.symmetric(
//                   horizontal: isSelected ? 12 : 0,
//                   vertical: 8,
//                 ),
//                 decoration:
//                     isSelected
//                         ? BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.vertical(
//                             top: Radius.circular(screenWidth * .01),
//                             bottom: Radius.circular(screenWidth * .16),
//                           ),
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Colors.white,
//                               blurRadius: 2,
//                               offset: Offset(0, 2),
//                             ),
//                           ],
//                         )
//                         : null,
//                 child: Stack(
//                   alignment: Alignment.center,
//                   clipBehavior: Clip.none,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           _getIcon(index, isSelected),
//                           color:
//                               isSelected
//                                   ? Colors.blue.shade700
//                                   : Colors.grey.shade300,
//                         ),
//                         if (isSelected) ...[
//                           const SizedBox(width: 8),
//                           Text(
//                             _getText(index),
//                             style: const TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.blue,
//                             ),
//                           ),
//                         ],
//                       ],
//                     ),
//                     if (isSelected)
//                       Positioned(
//                         top: -whiteLineHeight * 1.6,
//                         child: Icon(
//                           CupertinoIcons.flag_fill,
//                           size: 20,
//                           color: Colors.white,
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
//
//   IconData _getIcon(int index, bool isSelected) {
//     switch (index) {
//       case 0:
//         return isSelected ? Icons.home : Icons.home_outlined;
//       case 1:
//         return isSelected ? Icons.school : Icons.school_outlined;
//       case 2:
//         return isSelected ? Icons.work : Icons.work_outline;
//       case 3:
//         return isSelected ? Icons.person : Icons.person_outline;
//       default:
//         return Icons.help_outline;
//     }
//   }
//
//   String _getText(int index) {
//     switch (index) {
//       case 0:
//         return "Home";
//       case 1:
//         return "Learn";
//       case 2:
//         return "Jobs";
//       case 3:
//         return "Profile";
//       default:
//         return "";
//     }
//   }
// }
