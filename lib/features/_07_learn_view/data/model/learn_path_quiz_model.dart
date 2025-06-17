import 'package:road_man_project/features/_07_learn_view/data/model/learning_path_question_model.dart';

class LearnPathQuizModel {
  final int id;
  final String title;
  final DateTime createdAt;
  final bool isCompleted;
  final List<LearningPathQuestionModel> questions;

  const LearnPathQuizModel({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.isCompleted,
    required this.questions,
  });

  // Factory method to create a QuizModel from JSON
  factory LearnPathQuizModel.fromJson(Map<String, dynamic> json) {
    return LearnPathQuizModel(
      id: json['id'],
      title: json['title'],
      createdAt: DateTime.parse(json['createdAt']),
      isCompleted: json['isCompleted'],
      questions:
          (json['questions'] as List)
              .map((e) => LearningPathQuestionModel.fromJson(e))
              .toList(),
    );
  }

  // Convert QuizModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'createdAt': createdAt.toIso8601String(),
      'isCompleted': isCompleted,
      'questions': questions.map((q) => q.toJson()).toList(),
    };
  }
}
