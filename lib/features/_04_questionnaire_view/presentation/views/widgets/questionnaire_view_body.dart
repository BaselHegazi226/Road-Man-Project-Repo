import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_04_questionnaire_view/data/model/question_model.dart';
import 'package:road_man_project/features/_04_questionnaire_view/presentation/views/widgets/question_page.dart';

import '../../../../../core/utilities/base_text_styles.dart';
import '../../../../../core/utilities/dialogState.dart';
import '../../../data/model/answer_model.dart';
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

  final List<int> _navigationStack = [];

  // Keep track of all questions organized by page
  final Map<int, List<QuestionModel>> _pageQuestionsMap = {};

  // Keep track of page order for navigation
  final List<int> _pageOrder = [];

  // Track selected options for Flow questions
  final Map<int, String?> _flowSelectedOptions = {};

  // Track selected options for Radio/CheckBox questions
  final Map<int, Map<int, dynamic>> _pageSelections = {};

  int _totalPages = 0;
  bool _isLoading = true;

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

  void _navigateToPage(int pageIndex) {
    if (pageIndex >= 0 && pageIndex < _pageOrder.length) {
      _pageController.animateToPage(
        pageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousPage() {
    if (_navigationStack.isNotEmpty) {
      final previousPageIndex = _navigationStack.removeLast();
      _navigateToPage(previousPageIndex);
    } else if (_currentPage > 0) {
      _navigateToPage(_currentPage - 1);
    }
  }

  void _goToNextPage() {
    final currentPageNumber = _pageOrder[_currentPage];
    final pageQuestions = _pageQuestionsMap[currentPageNumber] ?? [];

    _navigationStack.add(_currentPage);

    // Check if this is a Flow page
    if (pageQuestions.isNotEmpty &&
        pageQuestions.first.questionForm == 'Flow') {
      // For Flow pages, navigation depends on the selected answer
      final questionId = pageQuestions.first.id;
      final selectedOption = _flowSelectedOptions[questionId];

      if (selectedOption != null) {
        // Find the nextPageNumber for the selected option
        final nextPageNumber = _findNextPageNumber(
          pageQuestions.first,
          selectedOption,
        );
        if (nextPageNumber > 0) {
          // Find the index of the next page in our pageOrder list
          final nextPageIndex = _pageOrder.indexOf(nextPageNumber);
          if (nextPageIndex >= 0) {
            _navigateToPage(nextPageIndex);
            return;
          }
        }
      }
    }

    // Default to next sequential page if not a Flow page or if no specific navigation

    if (pageQuestions.last.lastPage || _currentPage >= _totalPages - 1) {
      _handleQuestionnaireComplete();
    } else {
      _navigateToPage(_currentPage + 1);
    }
  }

  int _findNextPageNumber(QuestionModel question, String selectedOptionText) {
    final answer = question.answers.firstWhere(
      (a) => a.text == selectedOptionText,
      orElse: () => AnswerModel(id: -1, text: '', nextPageNumber: 0),
    );

    return answer.nextPageNumber;
  }

  void _handleQuestionnaireComplete() {
    // Collect all answers
    final questionnaireCubit = context.read<QuestionnaireCubit>();

    // Process all flow questions
    _flowSelectedOptions.forEach((questionId, selectedOption) {
      final question = _findQuestionById(questionId);
      if (question != null && selectedOption != null) {
        final answer = question.answers.firstWhere(
          (a) => a.text == selectedOption,
          orElse: () => AnswerModel(id: -1, text: '', nextPageNumber: 0),
        );
        if (answer.id > 0) {
          questionnaireCubit.submitAnswer(
            questionId: questionId,
            answerId: answer.id,
          );
        }
      }
    });

    // Process all radio/checkbox questions
    _pageSelections.forEach((pageNumber, selections) {
      selections.forEach((questionId, selected) {
        final question = _findQuestionById(questionId);
        if (question != null) {
          final selectedAnswerIds = <int>[];
          if (question.questionForm == 'RadioButton' && selected != null) {
            // For RadioButton, find the selected answer ID
            final answer = question.answers.firstWhere(
              (a) => a.text == selected,
              orElse: () => AnswerModel(id: -1, text: '', nextPageNumber: 0),
            );
            if (answer.id > 0) {
              questionnaireCubit.submitAnswer(
                questionId: questionId,
                answerId: answer.id,
              );
            }
          } else if (question.questionForm == 'CheckBox' &&
              selected is List<String>) {
            for (final option in selected) {
              final answer = question.answers.firstWhere(
                (a) => a.text == option,
                orElse: () => AnswerModel(id: -1, text: '', nextPageNumber: 0),
              );
              if (answer.id > 0) {
                selectedAnswerIds.add(answer.id);
              }
            }
            if (selectedAnswerIds.isNotEmpty) {
              questionnaireCubit.submitMultipleAnswers(
                questionId: questionId,
                answerIds: selectedAnswerIds,
              );
            }
          }
        }
      });
    });

    // Submit the questionnaire
    questionnaireCubit.submitQuestionnaire().then((_) {
      customAwesomeDialog(
        context: context,
        isSuccess: true,
        onPressed: () {},
        title: 'Questionnaire Complete',
        description: 'Thank you for completing the questionnaire!',
      );
    });
  }

  QuestionModel? _findQuestionById(int questionId) {
    for (final pageQuestions in _pageQuestionsMap.values) {
      for (final question in pageQuestions) {
        if (question.id == questionId) {
          return question;
        }
      }
    }
    return null;
  }

  void _selectFlowOption(int questionId, AnswerModel option) {
    setState(() {
      _flowSelectedOptions[questionId] = option.text;
    });

    // Submit the answer to update the backend
    final question = _findQuestionById(questionId);
    if (question != null) {
      final answer = question.answers.firstWhere(
        (a) => a == option,
        orElse: () => AnswerModel(id: -1, text: '', nextPageNumber: 0),
      );

      if (answer.id > 0) {

        if (answer.nextPageNumber > 0) {
          final nextPageIndex = _pageOrder.indexOf(answer.nextPageNumber);
          if (nextPageIndex >= 0) {
            _navigationStack.add(_currentPage);
            Future.delayed(const Duration(milliseconds: 300), () {
              _navigateToPage(nextPageIndex);
            });
            return;
          }
        }
      }
    }

    Future.delayed(const Duration(milliseconds: 300), _goToNextPage);
  }

  void _selectRadioOption(int pageNumber, int questionId, String value) {
    setState(() {
      _pageSelections.putIfAbsent(pageNumber, () => {});
      _pageSelections[pageNumber]![questionId] = value;
    });
  }

  void _selectCheckboxOption(
    int pageNumber,
    int questionId,
    String value,
    bool isSelected,
  ) {
    setState(() {
      _pageSelections.putIfAbsent(pageNumber, () => {});
      _pageSelections[pageNumber]?.putIfAbsent(questionId, () => <String>[]);

      final selectedOptions =
          _pageSelections[pageNumber]![questionId] as List<String>? ?? [];

      if (isSelected && !selectedOptions.contains(value)) {
        selectedOptions.add(value);
      } else if (!isSelected && selectedOptions.contains(value)) {
        selectedOptions.remove(value);
      }

      _pageSelections[pageNumber]![questionId] = selectedOptions;
    });
  }

  bool _canProceedFromPage(int pageNumber) {
    // Get all questions for this page
    final questions = _pageQuestionsMap[pageNumber] ?? [];

    // If it's a Flow page, we need a selection
    if (questions.isNotEmpty && questions.first.questionForm == 'Flow') {
      return _flowSelectedOptions[questions.first.id] != null;
    }

    // For Radio/CheckBox pages, check that all questions have answers
    final pageSelections = _pageSelections[pageNumber] ?? {};
    for (final question in questions) {
      final selection = pageSelections[question.id];

      if (question.questionForm == 'RadioButton') {
        // RadioButton should have one selected option
        if (selection == null) {
          return false;
        }
      } else if (question.questionForm == 'CheckBox') {
        // CheckBox should have at least one selected option
        if (selection == null || (selection is List && selection.isEmpty)) {
          return false;
        }
      }
    }

    return true;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Fetch questions when the widget is first built
    if (_isLoading) {
      context.read<QuestionnaireCubit>().fetchAllQuestions();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return BlocConsumer<QuestionnaireCubit, QuestionnaireState>(
      listener: (context, state) {
        if (state is FetchQuestionsSuccess) {
          _processQuestions(state.questions);
          setState(() {
            _isLoading = false;
          });
        }
      },
      builder: (context, state) {
        if (_isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final currentPageData = _pageQuestionsMap[_pageOrder[_currentPage]];

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lets Start..',
                style: AfacadTextStyles.textStyle24W700Black(context),
              ),
              const SizedBox(height: 16),

              GradientProgressBar(
                progress:
                    _pageOrder.isEmpty
                        ? 0.0
                        : _currentPage / (_pageOrder.length - 1),
              ),
              const SizedBox(height: 16),

              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);
                  },
                  itemCount: _pageOrder.length,
                  itemBuilder: (context, index) {
                    final pageNumber = _pageOrder[index];
                    final questions = _pageQuestionsMap[pageNumber] ?? [];

                    if (questions.isEmpty) {
                      return const Center(
                        child: Text('No questions for this page'),
                      );
                    }

                    // Flow pages have a single question
                    if (questions.first.questionForm == 'Flow') {
                      final question = questions.first;
                      final options =
                          question.answers;

                      return QuestionPage(
                        questionText: question.text,
                        options: options,
                        onOptionSelected:
                            (option) => _selectFlowOption(question.id, option),
                      );
                    } else {
                      // Sort questions by sortOrder
                      final sortedQuestions = List<QuestionModel>.from(
                        questions,
                      )..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

                      // Build RadioButton/CheckBox page
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Build each question
                            ...sortedQuestions.map((question) {
                              final questionId = question.id;
                              final options =
                                  question.answers.map((a) => a.text).toList();

                              // Get the selected value(s) for this question
                              final pageSelections =
                                  _pageSelections[pageNumber] ?? {};
                              final selected = pageSelections[questionId];

                              if (question.questionForm == 'RadioButton') {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: _buildRadioButtonQuestion(
                                    question.text,
                                    options,
                                    selected as String?,
                                    (value) => _selectRadioOption(
                                      pageNumber,
                                      questionId,
                                      value,
                                    ),
                                  ),
                                );
                              } else if (question.questionForm == 'CheckBox') {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: _buildCheckBoxQuestion(
                                    question.text,
                                    options,
                                    selected as List<String>? ?? [],
                                    (value, isSelected) =>
                                        _selectCheckboxOption(
                                          pageNumber,
                                          questionId,
                                          value,
                                          isSelected,
                                        ),
                                  ),
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            }),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),

              NavigationButtons(
                currentPage: _currentPage,
                totalPages: _pageOrder.length,
                showNext: currentPageData?.first.questionForm != 'Flow',
                isFinish: (currentPageData != null && currentPageData.last.lastPage),
                onPrevious: _goToPreviousPage,
                onNext: () {
                  final currentPageNumber = _pageOrder[_currentPage];
                  if (_canProceedFromPage(currentPageNumber)) {
                    _goToNextPage();
                  } else {
                    // Show a message that all questions must be answered
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please answer all questions on this page',
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRadioButtonQuestion(
    String question,
    List<String> options,
    String? selectedValue,
    Function(String) onSelected,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...options.map((option) {
          return RadioListTile<String>(
            title: Text(option),
            value: option,
            groupValue: selectedValue,
            onChanged: (value) {
              if (value != null) {
                onSelected(value);
              }
            },
          );
        }).toList(),
      ],
    );
  }

  Widget _buildCheckBoxQuestion(
    String question,
    List<String> options,
    List<String> selectedValues,
    Function(String, bool) onSelected,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...options.map((option) {
          return CheckboxListTile(
            title: Text(option),
            value: selectedValues.contains(option),
            onChanged: (isChecked) {
              if (isChecked != null) {
                onSelected(option, isChecked);
              }
            },
          );
        }).toList(),
      ],
    );
  }

  void _processQuestions(List<QuestionModel> questions) {
    // Reset state
    _pageQuestionsMap.clear();
    _pageOrder.clear();
    _flowSelectedOptions.clear();
    _pageSelections.clear();

    // Group questions by pageNumber
    for (final question in questions) {
      _pageQuestionsMap
          .putIfAbsent(question.pageNumber, () => [])
          .add(question);
    }

    // Create the initial page order (we'll start with page 1)
    _pageOrder.addAll(_pageQuestionsMap.keys.toList()..sort());

    // Set total pages
    _totalPages = _pageOrder.length;
  }
}
