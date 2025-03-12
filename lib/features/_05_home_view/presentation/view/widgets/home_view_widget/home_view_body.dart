import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_05_home_view/presentation/view/widgets/home_view_widget/custom_bottom_navigation_bar.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/profile_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      body: TabBarView(
        controller: tabController,
        children: const [
          Center(child: Text('Home', style: TextStyle(fontSize: 24))),
          Center(child: Text('Learn', style: TextStyle(fontSize: 24))),
          Center(child: Text('Job', style: TextStyle(fontSize: 24))),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        tabController: tabController,
      ),
    );
  }
}
