import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view_model/learning_path_bloc/learning_path_cubit.dart';
import 'package:road_man_project/generated/assets.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/manager/tokens_manager.dart';
import '../../../../../../core/utilities/show_snack_bar.dart';
import 'build_specific_step.dart';
import 'learning_path_step.dart';

class LearningPathViewBody extends StatefulWidget {
  const LearningPathViewBody({super.key});

  @override
  State<LearningPathViewBody> createState() => _LearningPathViewBodyState();
}

class _LearningPathViewBodyState extends State<LearningPathViewBody> {
  @override
  void initState() {
    super.initState();

    // لضمان سلامة الـ context
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeUserInfo();
    });
  }

  Future<void> _initializeUserInfo() async {
    final cubit = BlocProvider.of<LearningPathCubit>(context);

    final userTokenModel = await SecureStorageHelper.getUserTokens();

    if (!mounted) return;

    if (userTokenModel != null) {
      final data = await cubit.getLearningPathFun(
        userToken: userTokenModel.token,
      );
      print('Learning Path Data = $data');
    } else {
      showSafeSnackBar(context, "Session is expired...", kAppPrimaryWrongColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Learning path background image
          Positioned.fill(
            child: SvgPicture.asset(
              Assets.learningPathBackgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          //learning path
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(childCount: 5, (
                  context,
                  index,
                ) {
                  final level = index;
                  final isEvenLevel = level % 2 == 0;

                  final centerStep = Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * .03,
                      ),
                      child: LearningPathStep(
                        onPressed: () {},
                        image: Assets.learningPathFinishedStarImage,
                        iconColor: const Color(0xff69A123),
                        backgroundColor: const Color(0xff9EDA53),
                        shadowColor: const Color(0xff69A123),
                      ),
                    ),
                  );

                  final firstOffset = screenWidth * 0.2;
                  final secondOffset = screenWidth * 0.1;

                  final sideSteps =
                      isEvenLevel
                          ? [
                            BuildSpecificStep(
                              onPressed: () {
                                GoRouter.of(context).push(Routes.lessonViewId);
                              },
                              alignment: Alignment.centerRight,
                              horizontalOffset: firstOffset,
                              image: Assets.learningPathActiveLessonImage,
                              backgroundColor: const Color(0xff5385DA),
                              iconColor: Colors.white54,
                              shadowColor: const Color(0xff2961BE),
                            ),
                            BuildSpecificStep(
                              onPressed: () {
                                GoRouter.of(context).push(Routes.quizViewId);
                              },
                              alignment: Alignment.centerRight,
                              horizontalOffset: secondOffset,
                              image: Assets.learningPathActiveLessonImage,
                              backgroundColor: const Color(0xffE5E5E5),
                              iconColor: const Color(0xffB7B7B7),
                              shadowColor: const Color(0xffB7B7B7),
                            ),
                          ]
                          : [
                            BuildSpecificStep(
                              onPressed: () {
                                GoRouter.of(context).push(Routes.lessonViewId);
                              },
                              alignment: Alignment.centerLeft,
                              horizontalOffset: firstOffset,
                              image: Assets.learningPathActiveLessonImage,
                              backgroundColor: const Color(0xff5385DA),
                              iconColor: Colors.white54,
                              shadowColor: const Color(0xff2961BE),
                            ),
                            BuildSpecificStep(
                              onPressed: () {
                                GoRouter.of(context).push(Routes.quizViewId);
                              },
                              alignment: Alignment.centerLeft,
                              horizontalOffset: secondOffset,
                              image: Assets.learningPathActiveLessonImage,
                              backgroundColor: const Color(0xffE5E5E5),
                              iconColor: const Color(0xffB7B7B7),
                              shadowColor: const Color(0xffB7B7B7),
                            ),
                          ];

                  return Column(children: [centerStep, ...sideSteps]);
                }),
              ),
              SliverToBoxAdapter(child: SizedBox(height: screenHeight * .0625)),
            ],
          ),
        ],
      ),
    );
  }
}
