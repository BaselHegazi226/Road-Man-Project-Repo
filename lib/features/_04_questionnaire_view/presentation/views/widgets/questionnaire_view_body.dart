import 'package:flutter/material.dart';
import 'package:road_man_project/features/_04_questionnaire_view/presentation/views/widgets/question_page.dart';
import 'package:road_man_project/features/_04_questionnaire_view/presentation/views/widgets/questionnarie_header.dart';
import 'package:road_man_project/features/_04_questionnaire_view/presentation/views/widgets/radtion_button_question_page.dart';

import 'navigation_button.dart';

class QuestionnaireViewBody extends StatefulWidget {
  const QuestionnaireViewBody({super.key});

  @override
  State<QuestionnaireViewBody> createState() => _QuestionnaireViewBodyState();
}

class _QuestionnaireViewBodyState extends State<QuestionnaireViewBody> {
  late PageController _pageController;
  int _currentPage = 0;

  final List<String> _questionTexts = [
    'What is your purpose for using the application?',
    'How Can I help you today?',
    'What is the current status of your field?',
  ];

  final List<List<String>> _options = [
    ['Learn a new skill', 'Explore a suitable job'],
    [
      'I have an educational field and I want to complete it',
      'I don’t have a field and I want to start',
    ],
    [
      'I want to start from scratch',
      'I want to pursue the field from where I left off',
    ],
  ];

  final List<String?> _selectedOptions = [null, null, null, null];
  final List<List<String>> _radioPages = [
    [
      'What is your field?',
      'What are your learning goals?',
      'What kind of learning resources do you prefer?',
    ],
    ['At what level did you stop ?', 'What challenges are you facing now?'],
  ];

  final List<List<List<String>>> _radioOptions = [
    [
      ['Programming', 'UI UX', 'Digital Marketing'],
      ['For jog', 'Self-development', 'Getting a certification'],
      ['Visual', 'Textual', 'Interactive'],
    ],
    [
      ['Beginner', 'Intermediate', 'Advanced'],
      ['Unclear learning path', 'Insufficient content', 'Lack of time'],
    ],
  ];

  final List<List<String?>> _radioSelections = [
    [null, null, null],
    [null, null, null],
  ];

  int get _totalPages => 5;

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

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: screenHeight * .02,
        children: [
          QuestionnaireHeader(
            currentPage: _currentPage,
            totalPages: _totalPages,
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
}
