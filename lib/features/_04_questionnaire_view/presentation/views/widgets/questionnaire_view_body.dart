import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_04_questionnaire_view/presentation/views/widgets/question_list_page.dart';
import 'package:road_man_project/features/_04_questionnaire_view/presentation/views/widgets/question_page.dart';

import '../../../../../core/utilities/base_text_styles.dart';
import '../../view_model/questionnaire_cubit/questionnaire_cubit.dart';
import '../../view_model/questionnaire_cubit/questionnaire_state.dart';
import 'gradient_progress_bar.dart';
import 'navigation_button.dart';
import 'flow_question_widget.dart';
import 'radio_question_widget.dart';
import 'checkbox_question_widget.dart';

class QuestionnaireViewBody extends StatelessWidget {
  const QuestionnaireViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionnaireCubit, QuestionnaireState>(
      listener: (context, state) {
        if (state is QuestionnairePageChanged) {
          context.read<QuestionnaireCubit>().updateProgress();
        }
      },
      builder: (context, state) {
        final cubit = context.read<QuestionnaireCubit>();
        final screenWidth = MediaQuery.sizeOf(context).width;

        if (cubit.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 16),
              _buildProgressBar(cubit),
              const SizedBox(height: 16),
              _buildQuestionPages(cubit),
              _buildNavigationButtons(cubit),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Text(
      'Lets Start..',
      style: AfacadTextStyles.textStyle24W700Black(context),
    );
  }

  Widget _buildProgressBar(QuestionnaireCubit cubit) {
    return GradientProgressBar(progress: cubit.progress);
  }

  Widget _buildQuestionPages(QuestionnaireCubit cubit) {
    return Expanded(
      child: PageView.builder(
        controller: cubit.pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) => cubit.setCurrentPage(index),
        itemCount: cubit.totalPages,
        itemBuilder: (context, index) {
          final pageData = cubit.getPageData(index);

          if (pageData.isEmpty) {
            return const Center(child: Text('No questions for this page'));
          }

          return pageData.first.questionForm == 'Flow'
              ? FlowQuestionWidget(pageData: pageData)
              : QuestionListPage(pageData: pageData);
        },
      ),
    );
  }

  Widget _buildNavigationButtons(QuestionnaireCubit cubit) {
    final currentPageData = cubit.currentPageData;
    final isLastPage = currentPageData.isNotEmpty && currentPageData.last.lastPage;

    return NavigationButtons(
      currentPage: cubit.currentPage,
      totalPages: cubit.totalPages,
      showNext: currentPageData.isEmpty || currentPageData.first.questionForm != 'Flow',
      isFinish: isLastPage,
      onPrevious: cubit.goToPreviousPage,
      onNext: cubit.goToNextPage,
    );
  }
}