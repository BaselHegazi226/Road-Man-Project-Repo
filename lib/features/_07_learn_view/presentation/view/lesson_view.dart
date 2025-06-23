import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/custom_app_bar.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_lesson_model.dart';
import 'package:road_man_project/features/_07_learn_view/data/repos/learning_path_repo_impl.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/lesson_view_widgets/lesson_view_body.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view_model/learning_path_bloc/learning_path_blocs/Learning_path_bloc.dart';

class LessonView extends StatelessWidget {
  const LessonView({super.key});
  @override
  Widget build(BuildContext context) {
    final learnLessonModelList =
        GoRouterState.of(context).extra as List<LearnPathLessonModel>;
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: customAppBar(
        context,
        text: 'Ui\\Ux Designer ',
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      body: BlocProvider(
        create:
            (context) =>
                LearningPathBloc(learningPathRepo: LearningPathRepoImpl()),
        child: LessonViewBody(learnLessonModelList: learnLessonModelList),
      ),
    );
  }
}
