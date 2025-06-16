

class LearnPathLessonModel {
  final int lessonNumber;
  final int id;
  final String title;
  final String url;
  final int estimatedDuration;

  LearnPathLessonModel({
    required this.lessonNumber,
    required this.id,
    required this.title,
    required this.url,
    required this.estimatedDuration,
  });

  // Factory method to create a LessonModel from JSON
  factory LearnPathLessonModel.fromJson(Map<String, dynamic> json) {
    return LearnPathLessonModel(
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
