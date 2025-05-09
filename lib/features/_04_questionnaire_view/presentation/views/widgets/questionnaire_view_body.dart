import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_04_questionnaire_view/data/model/question_model.dart';
import 'package:road_man_project/features/_04_questionnaire_view/presentation/views/widgets/question_page.dart';
import 'package:road_man_project/features/_04_questionnaire_view/presentation/views/widgets/radtion_button_question_page.dart';

import '../../../../../core/utilities/base_text_styles.dart';
import '../../view_model/questionnaire_cubit/questionnaire_cubit.dart';
import '../../view_model/questionnaire_cubit/questionnaire_state.dart';
import 'gradient_progress_bar.dart';
import 'navigation_button.dart';

class QuestionnaireViewBody extends StatefulWidget {
  const QuestionnaireViewBody({super.key});

  @override
  State<QuestionnaireViewBody> createState() => _QuestionnaireViewBodyState();
}

class _QuestionnaireViewBodyState extends State<QuestionnaireViewBody> {
  late PageController _pageController;
  int _currentPage = 0;

  final List<String> _questionTexts = [];

  final List<List<String>> _options = [];

  late List<String?> _selectedOptions;
  final List<List<String>> _radioPages = [];

  final List<List<List<String>>> _radioOptions = [];

  late List<List<String?>> _radioSelections;

  late int _totalPages;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextQuestion() {
    if (_currentPage < _totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _handleQuestionnaireComplete();
    }
  }

  void _handleQuestionnaireComplete() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
        title: const Text('Questionnaire Complete'),
        content: const Text('Thank you for completing the questionnaire!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  void _selectOption(int questionIndex, String option) {
    setState(() {
      _selectedOptions[questionIndex] = option;
    });
    Future.delayed(const Duration(milliseconds: 300), _goToNextQuestion);
  }

  void _selectRadioOption(int pageIndex, int questionIndex, String value) {
    setState(() {
      _radioSelections[pageIndex][questionIndex] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return BlocConsumer<QuestionnaireCubit, QuestionnaireState>(
      listener: (context, state) {
      if (state is FetchQuestionsSuccess) {
        _addQuestions(state.questions);
      }
  },
  builder: (context, state) {
    if (state is FetchQuestionsSuccess) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: screenHeight * .02, //16
          children: [
            Text(
              'Lets Start..',
              style: AfacadTextStyles.textStyle24W700Black(context),
            ),

            GradientProgressBar(
              progress:
              _currentPage == 0 ? 0.0 : _currentPage / (_totalPages - 1),
            ),

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemCount: _totalPages,
                itemBuilder: (context, index) {
                  if (index < _questionTexts.length) {
                    return QuestionPage(
                      questionText: _questionTexts[index],
                      options: _options[index],
                      onOptionSelected: (option) => _selectOption(index, option),
                    );
                  } else {
                    int radioPageIndex = index - _questionTexts.length;
                    return RadioButtonQuestionPage(
                      questions: _radioPages[radioPageIndex],
                      options: _radioOptions[radioPageIndex],
                      selections: _radioSelections[radioPageIndex],
                      onOptionSelected: (qIndex, value) {
                        _selectRadioOption(radioPageIndex, qIndex, value);
                      },
                    );
                  }
                },
              ),
            ),

            NavigationButtons(
              currentPage: _currentPage,
              totalPages: _totalPages,
              onPrevious:
                  () => _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              ),
              onNext: _goToNextQuestion,
            ),
          ],
        ),
      );
    }
    return Center(
      child: CircularProgressIndicator(),
    );
  },
);
  }

  void _addQuestions(List<QuestionModel> questions) {
    // Temporary storage for non-Flow questions grouped by pageNumber
    final Map<int, List<QuestionModel>> radioPagesMap = {};

    for (final question in questions) {
      if (question.questionForm == 'Flow') {
        // Add to Flow questions
        _questionTexts.add(question.text);
        _options.add(
          question.answers.map((answer) => answer.text).toList(),
        );
      } else {
        // Group non-Flow questions by pageNumber
        radioPagesMap.putIfAbsent(question.pageNumber, () => []).add(question);
      }
    }

    // Process non-Flow questions: sort each page's questions and populate radioPages & radioOptions
    radioPagesMap.forEach((pageNumber, pageQuestions) {
      // Sort questions by their sortOrder
      pageQuestions.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

      // Extract question texts for the radio page
      _radioPages.add(
        pageQuestions.map((question) => question.text).toList(),
      );

      // Extract answer texts for each question in the radio page
      _radioOptions.add(
        pageQuestions
            .map((question) => question.answers.map((a) => a.text).toList())
            .toList(),
      );
    });

    // Update total pages count
    _totalPages = _questionTexts.length + _radioPages.length;

    // Initialize selected options for Flow questions
    _selectedOptions = List<String?>.filled(_questionTexts.length, null);

    // Initialize radio selections for each radio page
    _radioSelections = List.generate(
      _radioPages.length,
          (pageIndex) => List<String?>.filled(_radioPages[pageIndex].length, null),
    );

    // Trigger UI rebuild if needed
    if (mounted) setState(() {});
  }
}