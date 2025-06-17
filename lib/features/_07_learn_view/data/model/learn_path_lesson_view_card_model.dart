class LearnPathLessonViewCardModel {
  final String lessonNumber, title, estimatedDuration;
  final bool isAvailable;
  const LearnPathLessonViewCardModel({
    required this.lessonNumber,
    required this.title,
    required this.estimatedDuration,
    this.isAvailable = false,
  });
  // Map<String, dynamic> toJson() {
  //   return {
  //     'lessonNumber': lessonNumber,
  //     'title': title,
  //     'estimatedDuration': estimatedDuration,
  //   };
  // }
}
