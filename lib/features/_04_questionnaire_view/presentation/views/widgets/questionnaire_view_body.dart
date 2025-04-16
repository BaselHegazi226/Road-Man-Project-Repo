import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';
import 'package:road_man_project/features/_04_questionnaire_view/presentation/views/widgets/radio_button_question.dart';

import 'option_button.dart';

// Main questionnaire view widget (StatefulWidget)
class QuestionnaireViewBody extends StatefulWidget {
  const QuestionnaireViewBody({super.key});

  @override
  State<QuestionnaireViewBody> createState() => _QuestionnaireViewBodyState();
}

class _QuestionnaireViewBodyState extends State<QuestionnaireViewBody> {
  // PageController to manage PageView
  late PageController _pageController;

  // Current page index
  int _currentPage = 0;

  // Question data stored directly in lists
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

  // Store selected options
  final List<String?> _selectedOptions = [null, null, null, null];

  // Radio button pages data
  final List<List<String>> _radioPages = [
    // Page 5 questions
    [
      'What is your field?',
      'What are your learning goals?',
      'What kind of learning resources do you prefer?',
    ],
    // Page 6 questions
    ['At what level did you stop ?', 'What challenges are you facing now?'],
  ];

  // Radio button options for each question
  final List<List<List<String>>> _radioOptions = [
    // Page 5 options
    [
      ['Programming', 'UI UX', 'Digital Marketing'],
      ['For jog', 'Self-development', 'Getting a certification'],
      ['Visual', 'Textual', 'Interactive'],
    ],
    // Page 6 options
    [
      ['Beginner', 'Intermediate', 'Advanced'],
      ['Unclear learning path', 'Insufficient content', 'Lack of time'],
    ],
  ];

  // Store radio selections (for 6 questions across 2 pages)
  final List<List<String?>> _radioSelections = [
    [null, null, null], // Page 5 selections
    [null, null, null], // Page 6 selections
  ];

  // Total number of pages
  int get _totalPages => 5; // 4 original + 2 radio pages

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

  // Go to next question
  void _goToNextQuestion() {
    if (_currentPage < _totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Handle questionnaire completion
      _handleQuestionnaireComplete();
    }
  }

  // Handle questionnaire completion
  void _handleQuestionnaireComplete() {
    // Show completion dialog
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
                  // Navigate to next screen
                },
                child: const Text('Continue'),
              ),
            ],
          ),
    );
  }

  // Handle option selection
  void _selectOption(int questionIndex, String option) {
    setState(() {
      _selectedOptions[questionIndex] = option;
    });

    // Add a small delay before moving to the next question
    Future.delayed(const Duration(milliseconds: 300), _goToNextQuestion);
  }

  // Handle radio button selection
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
          Text('Lets Start..', style: AfacadTextStyles.textStyle24W700Black),

          // Progress bar
          //     GradientProgressBar(progress: _progress, horizontalPadding: 20),

          // Page indicator
          Center(
            child: Text(
              'Page ${_currentPage + 1} of $_totalPages',
              textAlign: TextAlign.center,
              style: AfacadTextStyles.textStyle16W600Grey,
            ),
          ),

          // PageView for questions
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(), // Disable swiping
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _totalPages,
              itemBuilder: (context, index) {
                // First 4 pages use original question format
                if (index < _questionTexts.length) {
                  return _buildQuestionPage(index);
                }
                // Last 2 pages use radio button format
                else {
                  int radioPageIndex = index - _questionTexts.length;
                  return _buildRadioButtonPage(radioPageIndex);
                }
              },
            ),
          ),

          // Navigation buttons
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * .005),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back button
                if (_currentPage > 0)
                  TextButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
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

                // Next button - only show on last 2 pages
                if (_currentPage >= _totalPages - 2)
                  TextButton(
                    onPressed: _goToNextQuestion,
                    child: Row(
                      spacing: screenWidth * .01,
                      children: [
                        Text(
                          'Next',
                          style: AfacadTextStyles.textStyle16W600HBlue,
                        ),
                        const Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Build an individual question page
  Widget _buildQuestionPage(int index) {
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * .04),

        // Question text
        Center(
          child: Text(
            _questionTexts[index],
            textAlign: TextAlign.center,
            style: AfacadTextStyles.textStyle24W700Black.copyWith(height: 1.5),
          ),
        ),

        SizedBox(height: screenHeight * .04),

        // Options
        ..._options[index].map(
          (option) => Padding(
            padding: EdgeInsets.only(bottom: screenHeight * .02),
            child: OptionButton(
              text: option,
              onPressed: () => _selectOption(index, option),
            ),
          ),
        ),
      ],
    );
  }

  // Build a page with radio button questions
  Widget _buildRadioButtonPage(int pageIndex) {
    return RadioButtonQuestion(
      questions: _radioPages[pageIndex],
      options: _radioOptions[pageIndex],
      selections: _radioSelections[pageIndex],
      onOptionSelected: (questionIndex, value) {
        _selectRadioOption(pageIndex, questionIndex, value);
      },
    );
  }
}
