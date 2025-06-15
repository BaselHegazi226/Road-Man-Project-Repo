class LessonModel {
  final int lessonNumber;
  final int id;
  final String title;
  final String url;
  final int estimatedDuration;

  LessonModel({
    required this.lessonNumber,
    required this.id,
    required this.title,
    required this.url,
    required this.estimatedDuration,
  });

  // Factory method to create a LessonModel from JSON
  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      lessonNumber: json['lessonNumber'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      estimatedDuration: json['estimatedDuration'],
    );
  }

  // Convert LessonModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'lessonNumber': lessonNumber,
      'id': id,
      'title': title,
      'url': url,
      'estimatedDuration': estimatedDuration,
    };
  }
}
