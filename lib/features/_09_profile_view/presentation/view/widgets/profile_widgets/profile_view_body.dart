import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/widgets/profile_widgets/profile_items_section.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/get_user_info_cubit/get_user_info_cubit.dart';

import '../00_profile_common_widgets/profile_user_info.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<GetUserInfoCubit>().getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
      child: Column(
        children: [
          ProfileUserInfo(email: 'email@gmail.com', name: 'name', photo: ''),
          ProfileItemsSection(),
        ],
      ),
    );
  }
}
