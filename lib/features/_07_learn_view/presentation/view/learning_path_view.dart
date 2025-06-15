import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_07_learn_view/data/repos/learning_path_repo_impl.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/learning_path_view_widgets/learning_path_view_body.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view_model/learning_path_bloc/learning_path_cubit.dart';

import '../../../../core/helper/const_variables.dart';

class LearningPathView extends StatelessWidget {
  const LearningPathView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              LearningPathCubit(learningPathRepo: LearningPathRepoImpl()),
      child: Scaffold(
        backgroundColor: kAppPrimaryWhiteColor,
        body: const LearningPathViewBody(),
      ),
    );
  }
}
