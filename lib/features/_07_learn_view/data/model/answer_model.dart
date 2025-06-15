class AnswerModel {
  final int id;
  final String text;
  final bool isCorrect;

  AnswerModel({required this.id, required this.text, required this.isCorrect});

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      id: json['id'],
      text: json['text'],
      isCorrect: json['isCorrect'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'text': text, 'isCorrect': isCorrect};
  }
}
