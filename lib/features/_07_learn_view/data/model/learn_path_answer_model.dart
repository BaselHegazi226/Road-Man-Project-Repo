class LearnPathAnswerModel {
  final int id;
  final String text;
  final bool isCorrect;

  const LearnPathAnswerModel({
    required this.id,
    required this.text,
    required this.isCorrect,
  });

  factory LearnPathAnswerModel.fromJson(Map<String, dynamic> json) {
    return LearnPathAnswerModel(
      id: json['id'],
      text: json['text'],
      isCorrect: json['isCorrect'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'text': text, 'isCorrect': isCorrect};
  }
}
