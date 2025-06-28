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
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/learning_path_view_widgets/step_style_helper.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/manager/user_learning_path_manager/user_learning_path_manager.dart';
import '../../../../../../generated/Assets.dart';
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
  int activeLevelIndex = 0;

  @override
  void initState() {
    super.initState();
    activeLevelIndex = UserLearningPathHelper.getActiveLevelIndex();
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
    final isCurrentOrPast = levelIndex <= activeLevelIndex;
    final isNextLevel = levelIndex == activeLevelIndex + 1;

    final lessonOffset = screenWidth * 0.2;
    final quizOffset = screenWidth * 0.1;

    StepType type;
    switch (index % 3) {
      case 0:
        type = StepType.star;
        break;
      case 1:
        type = StepType.lesson;
        break;
      case 2:
        type = StepType.quiz;
        break;
      default:
        type = StepType.lesson;
    }

    final level = isCurrentOrPast ? localLearningPaths[levelIndex] : null;
    final isEven = levelIndex % 2 == 0;

    final style = StepStyleHelper.getStepStyle(
      stepType: type,
      progressStatus: level?.progressStatus ?? 0,
    );

    VoidCallback? onPressed;

    if (isCurrentOrPast) {
      switch (type) {
        case StepType.star:
          onPressed = () {};
          break;
        case StepType.lesson:
          onPressed =
              () =>
                  GoRouter.of(context).push(Routes.lessonViewId, extra: level);
          break;
        case StepType.quiz:
          onPressed = () async {
            final userTokenModel = await SecureStorageHelper.getUserTokens();
            if (userTokenModel == null) return;

            final cubit = BlocProvider.of<LearningPathCubit>(context);
            await cubit.getQuizCompleted(
              userToken: userTokenModel.token,
              quizId: level!.quiz.id,
            );

            final state = cubit.state;
            if (state is QuizCompletedGetSuccess && state.finished) {
              GoRouter.of(context).push(Routes.quizViewId, extra: level.quiz);
            } else {
              customAwesomeDialog(
                context: context,
                title: 'Complete all lessons',
                description:
                    'In the first complete your lessons then try to solve your exercise',
                isSuccess: false,
                onPressed: () {},
              );
            }
          };
          break;
      }
    } else if (isNextLevel) {
      // مسموح يعرض النجمة فقط برسالة خاصة
      if (type == StepType.star) {
        onPressed = () {
          showSafeSnackBar(
            context,
            "New level will be available soon",
            Colors.blue,
          );
        };
      }
    }

    Widget stepWidget;
    switch (type) {
      case StepType.star:
        stepWidget = Center(
          child: LevelStep(
            image: style['image'],
            backgroundColor: style['background_color'],
            shadowColor: style['shadow_color'],
            onPressed: onPressed,
          ),
        );
        break;
      case StepType.lesson:
        stepWidget = LessonStep(
          onPressed: onPressed,
          alignment: isEven ? Alignment.centerLeft : Alignment.centerRight,
          horizontalOffset: lessonOffset,
          image: style['image'],
          backgroundColor: style['background_color'],
          shadowColor: style['shadow_color'],
        );
        break;
      case StepType.quiz:
        stepWidget = QuizStep(
          onPressed: onPressed,
          alignment: isEven ? Alignment.centerLeft : Alignment.centerRight,
          horizontalOffset: quizOffset,
          image: style['image'],
          backgroundColor: style['background_color'],
          iconColor: Colors.white,
          shadowColor: style['shadow_color'],
        );
        break;
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
      child: stepWidget,
    );
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
                      childCount: 15, // 5 مستويات × 3 عناصر
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
