import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';
import 'package:road_man_project/features/_04_questionnaire_view/presentation/views/widgets/radio_button_question.dart';

import 'option_button.dart';

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

// الكلاسات المنفصلة
class QuestionnaireHeader extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const QuestionnaireHeader({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: MediaQuery.sizeOf(context).height * .02,
      children: [
        Text('Lets Start..', style: AfacadTextStyles.textStyle24W700Black),
        Center(
          child: Text(
            'Page ${currentPage + 1} of $totalPages',
            textAlign: TextAlign.center,
            style: AfacadTextStyles.textStyle16W600Grey,
          ),
        ),
      ],
    );
  }
}

class QuestionPage extends StatelessWidget {
  final String questionText;
  final List<String> options;
  final Function(String option) onOptionSelected;

  const QuestionPage({
    super.key,
    required this.questionText,
    required this.options,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: screenHeight * .04),
        Center(
          child: Text(
            questionText,
            textAlign: TextAlign.center,
            style: AfacadTextStyles.textStyle24W700Black.copyWith(height: 1.5),
          ),
        ),
        SizedBox(height: screenHeight * .04),
        ...options.map(
          (option) => Padding(
            padding: EdgeInsets.only(bottom: screenHeight * .02),
            child: OptionButton(
              text: option,
              onPressed: () => onOptionSelected(option),
            ),
          ),
        ),
      ],
    );
  }
}

class RadioButtonQuestionPage extends StatelessWidget {
  final List<String> questions;
  final List<List<String>> options;
  final List<String?> selections;
  final Function(int questionIndex, String value) onOptionSelected;

  const RadioButtonQuestionPage({
    super.key,
    required this.questions,
    required this.options,
    required this.selections,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return RadioButtonQuestion(
      questions: questions,
      options: options,
      selections: selections,
      onOptionSelected: onOptionSelected,
    );
  }
}

class NavigationButtons extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const NavigationButtons({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.sizeOf(context).height * .005,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentPage > 0)
            TextButton(
              onPressed: onPrevious,
              child: Row(
                spacing: screenWidth * .01,
                children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    size: 16,
                    color: kAppPrimaryBlueColor,
                  ),
                  Text(
                    'Previous',
                    style: AfacadTextStyles.textStyle16W600HBlue,
                  ),
                ],
              ),
            ),
          if (currentPage >= totalPages - 2)
            TextButton(
              onPressed: onNext,
              child: Row(
                spacing: screenWidth * .01,
                children: [
                  Text('Next', style: AfacadTextStyles.textStyle16W600HBlue),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
