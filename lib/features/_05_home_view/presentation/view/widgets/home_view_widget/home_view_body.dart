import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_05_home_view/presentation/view/widgets/home_view_widget/custom_bottom_navigation_bar.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/profile_view.dart';

import '../../../../../_08_job_view/presentation/view/job_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  // ربط التبويبات بالألوان الخاصة بها
  final Map<int, Color> screenColor = {
    0: kAppPrimaryWhiteColor, // Home
    1: kAppPrimaryWhiteColor, // Learn
    2: Color(0xffE6E8EE), // Job
    3: kAppPrimaryWhiteColor, // Profile
  };

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {}); // إعادة بناء الواجهة عند تغيير التبويب
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          screenColor[tabController.index] ??
          kAppPrimaryWhiteColor, // تغيير لون الخلفية
      body: TabBarView(
        controller: tabController,
        children: const [
          Center(child: Text('Home', style: TextStyle(fontSize: 24))),
          Center(child: Text('Learn', style: TextStyle(fontSize: 24))),
          JobView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        tabController: tabController,
        backgroundColor:
            screenColor[tabController.index] ??
            kAppPrimaryWhiteColor, // تمرير اللون للبوتوم بار
      ),
    );
  }
}
