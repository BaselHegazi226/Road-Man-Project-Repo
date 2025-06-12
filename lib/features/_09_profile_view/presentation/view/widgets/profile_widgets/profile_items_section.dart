import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/widgets/profile_widgets/profile_item.dart';

import '../../../../../../core/utilities/routes.dart';
import '../../../view_model/get_user_info_cubit/get_user_info_cubit.dart';
import '../00_profile_common_widgets/profile_const_list.dart';

class ProfileItemsSection extends StatelessWidget {
  const ProfileItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ProfileConstList.profileItemModelList.length,
      itemBuilder: (context, index) {
        final item = ProfileConstList.profileItemModelList[index];

        return ProfileItem(
          profileItemModel: item,
          onTap: () async {
            // لو الزرار هو Edit Profile
            if (item.routeName == Routes.editProfileViewId) {
              final result = await GoRouter.of(
                context,
              ).push<bool>(item.routeName);

              if (result == true && context.mounted) {
                BlocProvider.of<GetUserInfoCubit>(context).localGetUserInfo();
              }
            }
            // باقي العناصر
            else if (item.routeName.isNotEmpty) {
              GoRouter.of(context).push(item.routeName);
            }
          },
        );
      },
    );
  }
}
