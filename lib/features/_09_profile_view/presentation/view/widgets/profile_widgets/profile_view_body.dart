import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/tokens_manager/tokens_manager.dart';
import 'package:road_man_project/core/utilities/show_snack_bar.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/widgets/profile_widgets/profile_items_section.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/get_user_info_cubit/get_user_info_state.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_state.dart';

import '../../../../../../core/tokens_manager/user_info_manager.dart';
import '../../../../../../generated/assets.dart';
import '../00_profile_common_widgets/profile_user_info.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  void initState() {
    super.initState();

    // لضمان سلامة الـ context
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeUserInfo();
    });
  }

  Future<void> _initializeUserInfo() async {
    final cubit = BlocProvider.of<GetUserInfoCubit>(context);

    await cubit.localGetUserInfo();

    final localData = await UserInfoStorageHelper.getUserInfo();
    if (localData == null) {
      final userTokenModel = await SecureStorageHelper.getUserTokens();

      if (!mounted) return;

      if (userTokenModel != null) {
        await cubit.getUserInfo(userToken: userTokenModel.token);
      } else {
        showSnackBar(context, "Session is expired...", kAppPrimaryWrongColor);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
      child: Column(
        children: [
          BlocConsumer<GetUserInfoCubit, ProfileStates>(
            listener: (context, state) {
              if (state is GetUserInfoFailureState) {
                showSnackBar(
                  context,
                  state.errorMessage,
                  kAppPrimaryWrongColor,
                );
              }
            },
            builder: (context, state) {
              if (state is GetUserInfoLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is GetUserInfoSuccessState ||
                  state is GetUserInfoLocalSuccessState) {
                final user =
                    state is GetUserInfoSuccessState
                        ? state.userInfoModel
                        : (state as GetUserInfoLocalSuccessState).userInfoModel;

                return ProfileUserInfo(
                  email: user.email ?? 'No Email',
                  name: user.name ?? 'No Name',
                  photo: user.photo ?? Assets.profileProfileUserImage,
                );
              }

              return ProfileUserInfo(
                email: 'email@gmail.com',
                name: 'name',
                photo: Assets.profileProfileUserImage,
              );
            },
          ),
          const ProfileItemsSection(),
        ],
      ),
    );
  }
}
