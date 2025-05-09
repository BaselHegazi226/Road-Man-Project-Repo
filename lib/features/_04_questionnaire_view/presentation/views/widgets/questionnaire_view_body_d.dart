import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';
import 'package:road_man_project/features/_04_questionnaire_view/presentation/view_model/questionnaire_cubit/questionnaire_cubit.dart';
import 'package:road_man_project/features/_04_questionnaire_view/presentation/view_model/questionnaire_cubit/questionnaire_state.dart';
import 'package:road_man_project/features/_04_questionnaire_view/presentation/views/widgets/gradient_progress_bar.dart';
import 'package:road_man_project/features/_04_questionnaire_view/presentation/views/widgets/navigation_button.dart';

import '../../../data/model/question_model.dart';

class QuestionnaireViewBody extends StatefulWidget {
  const QuestionnaireViewBody({super.key});

  @override
  State<QuestionnaireViewBody> createState() => _QuestionnaireViewBodyState();
}

class _QuestionnaireViewBodyState extends State<QuestionnaireViewBody> {
  late PageController _pageController;
  int _currentPage = 1; // Start with page 1
  int _maxPage = 1; // Will be updated as we navigate
  QuestionModel? _currentQuestion;

  // For checkbox questions
  final Map<int, List<int>> _selectedCheckboxAnswers = {};

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // No need to load initial questions here as the BlocProvider
    // already does that in the parent widget
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleAnswerSelection(int answerId) {
    if (_currentQuestion == null) return;

    // For Flow and RadioButton questions
    context.read<QuestionnaireCubit>().submitAnswer(
      questionId: _currentQuestion!.id,
      answerId: answerId,
    );
  }

  void _handleCheckboxSubmit() {
    if (_currentQuestion == null) return;

    final selectedAnswers = _selectedCheckboxAnswers[_currentQuestion!.id] ?? [];
    if (selectedAnswers.isEmpty) return;

    context.read<QuestionnaireCubit>().submitMultipleAnswers(
      questionId: _currentQuestion!.id,
      answerIds: selectedAnswers,
    );
  }

  void _toggleCheckboxAnswer(int answerId, bool selected) {
    if (_currentQuestion == null) return;

    setState(() {
      // Initialize the list if it's not already created
      _selectedCheckboxAnswers[_currentQuestion!.id] ??= [];

      // Add or remove based on selection
      if (selected) {
        _selectedCheckboxAnswers[_currentQuestion!.id]!.add(answerId);
      } else {
        _selectedCheckboxAnswers[_currentQuestion!.id]!.remove(answerId);
      }
    });
  }

  void _goToNextPage() {
    // For manually navigating with navigation buttons
    if (_currentQuestion?.questionForm == 'CheckBox') {
      _handleCheckboxSubmit();
    } else {
      // For Flow and RadioButton questions, we'd normally
      // handle this when an option is selected
      // This is for the case when someone wants to skip without selecting
      context.read<QuestionnaireCubit>().fetchQuestionByPageNumber(_currentPage + 1);
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 1) {
      context.read<QuestionnaireCubit>().fetchQuestionByPageNumber(_currentPage - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return BlocConsumer<QuestionnaireCubit, QuestionnaireState>(
      listener: (context, state) {
        if (state is FetchQuestionsSuccess) {
          setState(() {
            _currentQuestion = state.questions.first;
            _currentPage = state.questions.first.pageNumber;
            if (_currentPage > _maxPage) {
              _maxPage = _currentPage;
            }
          });
        } else if (state is SubmitAnswerSuccess) {
          // Navigate to next page if available
          if (state.nextPageNumber > 0) {
            context.read<QuestionnaireCubit>().fetchQuestionByPageNumber(state.nextPageNumber);
          } else {
            // Submit the entire questionnaire if we've reached the end
            context.read<QuestionnaireCubit>().submitQuestionnaire();
          }
        } else if (state is SubmitQuestionnaireSuccess) {
          _handleQuestionnaireComplete();
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            // Note: I changed 'spacing' to 'children' since Column uses 'children'
            children: [
              Text(
                'Lets Start..',
                style: AfacadTextStyles.textStyle24W700Black(context),
              ),

              SizedBox(height: screenHeight * .02),

              GradientProgressBar(
                progress: _maxPage == 1
                    ? 0.0
                    : _currentPage / (_maxPage),
              ),

              SizedBox(height: screenHeight * .02),

              Expanded(
                child: _buildQuestionContent(state),
              ),

              NavigationButtons(
                currentPage: _currentPage,
                totalPages: 11, // Assuming 11 is the total pages as seen in the JSON
                onPrevious: _goToPreviousPage,
                onNext: _goToNextPage,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildQuestionContent(QuestionnaireState state) {
    if (state is FetchQuestionsLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is FetchQuestionsFailure) {
      return Center(child: Text('Error: ${state.errorMessage}'));
    } else if (_currentQuestion != null) {
      return _buildQuestionByType(_currentQuestion!);
    } else {
      return const Center(child: Text('Loading questionnaire...'));
    }
  }

  Widget _buildQuestionByType(QuestionModel question) {
    switch (question.questionForm) {
      case 'Flow':
        return _buildFlowQuestion(question);
      case 'RadioButton':
        return _buildRadioButtonQuestion(question);
      case 'CheckBox':
        return _buildCheckboxQuestion(question);
      default:
        return Center(child: Text('Unsupported question type: ${question.questionForm}'));
    }
  }

  Widget _buildFlowQuestion(QuestionModel question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.text,
          style: AfacadTextStyles.textStyle18W600Black(context),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Expanded(
          child: ListView.builder(
            itemCount: question.answers.length,
            itemBuilder: (context, index) {
              final answer = question.answers[index];
              return GestureDetector(
                onTap: () => _handleAnswerSelection(answer.id),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    answer.text,
                    style: AfacadTextStyles.textStyle16W400Black(context),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRadioButtonQuestion(QuestionModel question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.text,
          style: AfacadTextStyles.textStyle18W600Black(context),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Expanded(
          child: ListView.builder(
            itemCount: question.answers.length,
            itemBuilder: (context, index) {
              final answer = question.answers[index];
              return RadioListTile(
                title: Text(
                  answer.text,
                  style: AfacadTextStyles.textStyle16W400Black(context),
                ),
                value: answer.id,
                groupValue: null, // We don't track the selected value in the UI
                onChanged: (_) => _handleAnswerSelection(answer.id),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCheckboxQuestion(QuestionModel question) {
    final selectedAnswers = _selectedCheckboxAnswers[question.id] ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.text,
          style: AfacadTextStyles.textStyle18W600Black(context),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Expanded(
          child: ListView.builder(
            itemCount: question.answers.length,
            itemBuilder: (context, index) {
              final answer = question.answers[index];
              return CheckboxListTile(
                title: Text(
                  answer.text,
                  style: AfacadTextStyles.textStyle16W400Black(context),
                ),
                value: selectedAnswers.contains(answer.id),
                onChanged: (selected) =>
                    _toggleCheckboxAnswer(answer.id, selected ?? false),
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: selectedAnswers.isNotEmpty ? _handleCheckboxSubmit : null,
          child: const Text('Continue'),
        ),
      ],
    );
  }

  void _handleQuestionnaireComplete() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Questionnaire Complete'),
        content: const Text('Thank you for completing the questionnaire!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // You might want to navigate away from the questionnaire screen here
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}
