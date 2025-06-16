import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_quiz_model.dart';

import 'learn_path_lesson_model.dart';

class LearningPathModel {
  final int levelNumber;
  final int id;
  final int progressStatus;
  final int trackResourceId;
  final String url;
  final String title;
  final String level;
  final String language;
  final String typeOfContent;
  final int estimatedDuration;
  final List<LearnPathLessonModel> lessons;
  final LearnPathQuizModel quiz;

  const LearningPathModel({
    required this.levelNumber,
    required this.id,
    required this.progressStatus,
    required this.trackResourceId,
    required this.url,
    required this.title,
    required this.level,
    required this.language,
    required this.typeOfContent,
    required this.estimatedDuration,
    required this.lessons,
    required this.quiz,
  });

  // Factory method to create a LearningPathModel from JSON
  factory LearningPathModel.fromJson(Map<String, dynamic> json) {
    return LearningPathModel(
      levelNumber: json['levelNumber'],
      id: json['id'],
      progressStatus: json['progressStatus'],
      trackResourceId: json['trackResourceId'],
      url: json['url'],
      title: json['title'],
      level: json['level'],
      language: json['language'],
      typeOfContent: json['typeOfContent'],
      estimatedDuration: json['estimatedDuration'],
      lessons:
          (json['lessons'] as List)
              .map((e) => LearnPathLessonModel.fromJson(e))
              .toList(),
      quiz: LearnPathQuizModel.fromJson(json['quiz']),
    );
  }

  // Convert LearningPathModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'levelNumber': levelNumber,
      'id': id,
      'progressStatus': progressStatus,
      'trackResourceId': trackResourceId,
      'url': url,
      'title': title,
      'level': level,
      'language': language,
      'typeOfContent': typeOfContent,
      'estimatedDuration': estimatedDuration,
      'lessons': lessons.map((lesson) => lesson.toJson()).toList(),
      'quiz': quiz.toJson(),
    };
  }
}
