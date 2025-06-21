import 'dart:math';

import 'package:hive/hive.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_answer_model.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_lesson_model.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_model.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_quiz_model.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_user_answer_model.dart';

abstract class UserLearningPathHelper {
  static const String _learningPathBox = 'learningPathBox';
  static const String _lessonsBox = 'lessonsBox';
  static const String _quizzesBox = 'quizzesBox';
  static const String _answersBox = 'answersBox';
  static const String _userAnswersBox = 'userAnswersBox';

  // Initialization
  static Future<void> initHiveBoxes() async {
    await Hive.openBox<LearnPathModel>(_learningPathBox);
    await Hive.openBox<LearnPathLessonModel>(_lessonsBox);
    await Hive.openBox<LearnPathQuizModel>(_quizzesBox);
    await Hive.openBox<LearnPathAnswerModel>(_answersBox);
    await Hive.openBox<LearnPathUserAnswerModel>(_userAnswersBox);
  }

  // Save Learning Paths
  static Future<void> saveLearningPaths(List<LearnPathModel> list) async {
    final box = Hive.box<LearnPathModel>(_learningPathBox);
    for (var item in list) {
      log('level : $item' as num);
      await box.put(item.id, item);
    }
  }

  // Save Lessons
  static Future<void> saveLessons(List<LearnPathLessonModel> list) async {
    final box = Hive.box<LearnPathLessonModel>(_lessonsBox);
    for (var item in list) {
      await box.put(item.id, item);
    }
  }

  // Save Quizzes
  static Future<void> saveQuizzes(List<LearnPathQuizModel> list) async {
    final box = Hive.box<LearnPathQuizModel>(_quizzesBox);
    for (var item in list) {
      await box.put(item.id, item);
    }
  }

  // Save Available Answers
  static Future<void> saveAnswers(List<LearnPathAnswerModel> answers) async {
    final box = Hive.box<LearnPathAnswerModel>(_answersBox);
    for (final answer in answers) {
      await box.put(answer.id, answer);
    }
  }

  // Save User Answer
  static Future<void> saveUserAnswer(LearnPathUserAnswerModel answer) async {
    final box = Hive.box<LearnPathUserAnswerModel>(_userAnswersBox);
    await box.put(answer.userAnswerId, answer);
  }

  // Save Multiple User Answers
  static Future<void> saveUserAnswers(
    List<LearnPathUserAnswerModel> answers,
  ) async {
    final box = Hive.box<LearnPathUserAnswerModel>(_userAnswersBox);
    for (final answer in answers) {
      await box.put(answer.userAnswerId, answer);
    }
  }

  // Getters
  static List<LearnPathModel> getAllLearningPaths() {
    final box = Hive.box<LearnPathModel>(_learningPathBox);
    return box.values.toList();
  }

  static List<LearnPathLessonModel> getAllLessons() {
    final box = Hive.box<LearnPathLessonModel>(_lessonsBox);
    return box.values.toList();
  }

  static List<LearnPathQuizModel> getAllQuizzes() {
    final box = Hive.box<LearnPathQuizModel>(_quizzesBox);
    return box.values.toList();
  }

  static List<LearnPathAnswerModel> getAllAnswers() {
    final box = Hive.box<LearnPathAnswerModel>(_answersBox);
    return box.values.toList();
  }

  static List<LearnPathUserAnswerModel> getAllUserAnswers() {
    final box = Hive.box<LearnPathUserAnswerModel>(_userAnswersBox);
    return box.values.toList();
  }

  static LearnPathUserAnswerModel? getUserAnswerById(int answerId) {
    final box = Hive.box<LearnPathUserAnswerModel>(_userAnswersBox);
    return box.get(answerId);
  }

  // Clear all local data
  static Future<void> deleteAllData() async {
    await Hive.box<LearnPathModel>(_learningPathBox).clear();
    await Hive.box<LearnPathLessonModel>(_lessonsBox).clear();
    await Hive.box<LearnPathQuizModel>(_quizzesBox).clear();
    await Hive.box<LearnPathAnswerModel>(_answersBox).clear();
    await Hive.box<LearnPathUserAnswerModel>(_userAnswersBox).clear();
  }
}
