import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/custom_flexible_widget.dart';
import 'package:road_man_project/core/utilities/dialogState.dart';
import 'package:road_man_project/core/utilities/show_snack_bar.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view_model/learning_path_bloc/learning_path_blocs/Learning_path_bloc.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view_model/learning_path_bloc/learning_path_cubit/learning_path_states.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../data/model/learn_path_lesson_model.dart';
import '../../../view_model/learning_path_bloc/learning_path_blocs/Learning_path_events.dart';
import 'lesson_view_card_body.dart';

class LessonViewCard extends StatelessWidget {
  const LessonViewCard({
    super.key,
    required this.learnPathLessonModel,
    required this.userToken,
    required this.index,
    required this.currentAllowedIndex,
    required this.onLessonCompleted,
  });

  final LearnPathLessonModel learnPathLessonModel;
  final String userToken;
  final int index;
  final int currentAllowedIndex;
  final VoidCallback onLessonCompleted;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final bool isUnlocked = index <= currentAllowedIndex;

    return Container(
      width: screenWidth,
      height: screenHeight * .14,
      padding: EdgeInsets.all(screenWidth * .04),
      margin: EdgeInsets.only(bottom: screenHeight * .005),
      decoration: BoxDecoration(
        color: const Color(0xffE6E8EE),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(screenWidth * .04),
          topLeft: Radius.circular(screenWidth * .04),
        ),
      ),
      child: CustomFlexibleWidget(
        child: BlocConsumer<LearningPathBloc, LearningPathStates>(
          listener: (context, state) {
            if (state is LessonCompletedSuccess &&
                state.lessonId == learnPathLessonModel.id) {
              showSafeSnackBar(
                context,
                'Lesson 0${learnPathLessonModel.lessonNumber} is completed successfully. Go to home view to follow your progress.',
                kAppPrimaryBlueColor,
              );
              onLessonCompleted();
            } else if (state is LessonCompletedFailure) {
              customAwesomeDialog(
                title: 'Failed',
                description:
                    'Can\'t open the source. Wait to solve your problem!',
                context: context,
                isSuccess: false,
                onPressed: () {},
              );
            }
          },
          builder: (context, state) {
            return LessonViewCardBody(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              learnPathLessonModel: learnPathLessonModel,
              onPressed:
                  isUnlocked
                      ? () async {
                        context.read<LearningPathBloc>().add(
                          LessonCompletedEvent(
                            userToken: userToken,
                            lessonId: learnPathLessonModel.id,
                          ),
                        );
                        await openUrlFun(context);
                      }
                      : null,
              lessonIsCompleted: index < currentAllowedIndex,
              isUnlocked: isUnlocked,
            );
          },
        ),
      ),
    );
  }

  Future<void> openUrlFun(BuildContext context) async {
    final String fixedUrl =
        learnPathLessonModel.url.startsWith('http')
            ? learnPathLessonModel.url
            : 'https://${learnPathLessonModel.url}';
    final Uri url = Uri.parse(Uri.encodeFull(fixedUrl));

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      showSafeSnackBar(
        context,
        'Unable to open link. Please try again!',
        kAppPrimaryWrongColor,
      );
    }
  }
}
