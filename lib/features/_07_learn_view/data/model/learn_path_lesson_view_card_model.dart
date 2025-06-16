

class LearnPathLessonViewCardModel {
  final String lesson, lessonTitle, lessonTime;
  final bool isAvailable;
  const LearnPathLessonViewCardModel({
    required this.lesson,
    required this.lessonTitle,
    required this.lessonTime,
    this.isAvailable = false,
  });
}
