import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/manager/tokens_manager.dart';
import 'package:road_man_project/core/utilities/dialogState.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/core/utilities/show_snack_bar.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_lesson_model.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_model.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_quiz_model.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/learning_path_view_widgets/learning_path_step.dart';
import 'package:road_man_project/generated/assets.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/manager/user_learning_path_manager/user_learning_path_manager.dart';
import '../../../view_model/learning_path_bloc/learning_path_cubit/learning_path_cubit.dart';
import '../../../view_model/learning_path_bloc/learning_path_cubit/learning_path_states.dart';
import 'build_specific_step.dart';

class LearningPathViewBody extends StatefulWidget {
  const LearningPathViewBody({super.key});

  @override
  State<LearningPathViewBody> createState() => _LearningPathViewBodyState();
}

class _LearningPathViewBodyState extends State<LearningPathViewBody> {
  List<LearnPathModel> localLearningPaths = [];

  @override
  void initState() {
    super.initState();
    _loadLearningPaths();
  }

  Future<void> _loadLearningPaths() async {
    final cubit = BlocProvider.of<LearningPathCubit>(context);
    final existingPaths = UserLearningPathHelper.getAllLearningPaths();

    if (existingPaths.isEmpty) {
      final userTokenModel = await SecureStorageHelper.getUserTokens();
      if (!mounted) return;

      if (userTokenModel != null) {
        await cubit.getLearningPathFun(userToken: userTokenModel.token);
      } else {
        showSafeSnackBar(
          context,
          "Session is expired...",
          kAppPrimaryWrongColor,
        );
      }
    } else {
      setState(() => localLearningPaths = existingPaths);
    }
  }

  void _handleLearningPathSuccess(LearningPathSuccess state) {
    final fetchedPaths =
        (state.learningPath['learningPath'] as List)
            .map((e) => LearnPathModel.fromJson(e as Map<String, dynamic>))
            .toList();

    final allLessons = <LearnPathLessonModel>[];
    final allQuizzes = <LearnPathQuizModel>[];

    for (final path in fetchedPaths) {
      allLessons.addAll(path.lessons);
      allQuizzes.add(path.quiz);
    }

    UserLearningPathHelper.saveLearningPaths(fetchedPaths);
    UserLearningPathHelper.saveLessons(allLessons);
    UserLearningPathHelper.saveQuizzes(allQuizzes);

    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) setState(() => localLearningPaths = fetchedPaths);
      });
    }
  }

  Widget _buildStep(int index, double screenWidth, double screenHeight) {
    final levelIndex = index ~/ 3;
    if (levelIndex >= localLearningPaths.length) return const SizedBox.shrink();

    final level = localLearningPaths[levelIndex];
    final isEven = levelIndex % 2 == 0;
    final lessonOffset = screenWidth * 0.2;
    final quizOffset = screenWidth * 0.1;
    final type = index % 3;

    switch (type) {
      case 0:
        return Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * .02),
          child: Center(
            child: LevelStep(
              image: Assets.learningPathFinishedStarImage,
              backgroundColor: const Color(0xff9EDA53),
              shadowColor: const Color(0xff69A123),
              iconColor: const Color(0xff69A123),
              onPressed: () {},
            ),
          ),
        );
      case 1:
        if (level.lessons.isEmpty) return const SizedBox.shrink();
        return LessonStep(
          onPressed:
              () =>
                  GoRouter.of(context).push(Routes.lessonViewId, extra: level),
          alignment: isEven ? Alignment.centerLeft : Alignment.centerRight,
          horizontalOffset: lessonOffset,
          image: Assets.learningPathActiveLessonImage,
          backgroundColor: const Color(0xff5385DA),
          iconColor: Colors.white54,
          shadowColor: const Color(0xff2961BE),
        );
      case 2:
        return Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * .015),
          child: QuizStep(
            onPressed:
                () =>
                    level.progressStatus == 100
                        ? GoRouter.of(
                          context,
                        ).push(Routes.quizViewId, extra: level.quiz)
                        : customAwesomeDialog(
                          context: context,
                          title: 'complete all lessons',
                          description:
                              'in the first complete your lessons then try to solve your exercise',
                          isSuccess: false,
                          onPressed: () {},
                        ),
            alignment: isEven ? Alignment.centerLeft : Alignment.centerRight,
            horizontalOffset: quizOffset,
            image: Assets.learningPathActiveQuizImage,
            backgroundColor: const Color(0xff5385DA),
            iconColor: Colors.white54,
            shadowColor: const Color(0xff2961BE),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<LearningPathCubit, LearningPathStates>(
      listener: (context, state) {
        if (state is LearningPathSuccess) _handleLearningPathSuccess(state);
      },
      builder: (context, state) {
        if (state is LearningPathLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final limitedLevels =
            localLearningPaths.length >= 5
                ? localLearningPaths.sublist(0, 5)
                : localLearningPaths;

        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  Assets.learningPathBackgroundImage,
                  fit: BoxFit.cover,
                ),
              ),
              CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          _buildStep(index, screenWidth, screenHeight),
                      childCount: limitedLevels.length * 3,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: screenHeight * 0.05),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
