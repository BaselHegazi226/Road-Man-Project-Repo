import '../../../_04_questionnaire_view/data/model/answer_model.dart';

class QuestionModel {
  final int id;
  final String text;
  final List<AnswerModel> answers;

  QuestionModel({required this.id, required this.text, required this.answers});

  // Factory method to create a QuestionModel from JSON
  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      text: json['text'],
      answers:
          (json['answers'] as List)
              .map((e) => AnswerModel.fromJson(e))
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
