class LessonViewCardModel {
  final String lesson, lessonTitle, lessonTime;
  final bool isAvailable;
  const LessonViewCardModel({
    required this.lesson,
    required this.lessonTitle,
    required this.lessonTime,
    this.isAvailable = false,
  });
}
