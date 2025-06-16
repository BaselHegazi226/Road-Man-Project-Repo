import 'learn_path_answer_model.dart';



class LearningPathQuestionModel {
  final int id;
  final String text;
  final List<LearnPathAnswerModel> answers;

  LearningPathQuestionModel({required this.id, required this.text, required this.answers});

  // Factory method to create a QuestionModel from JSON
  factory LearningPathQuestionModel.fromJson(Map<String, dynamic> json) {
    return LearningPathQuestionModel(
      id: json['id'],
      text: json['text'],
      answers:
          (json['answers'] as List)
              .map((e) => LearnPathAnswerModel.fromJson(e))
              .toList(),
    );
  }

  // Convert QuestionModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'answers': answers.map((a) => a.toJson()).toList(),
    };
  }
}
