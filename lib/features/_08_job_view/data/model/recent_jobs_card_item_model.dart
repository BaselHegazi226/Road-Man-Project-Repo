// Job Model
class RecentJobsCardItemModel {
  final String title;
  final String salary;
  final String jobType;
  final String company;
  final String location;
  final String timeLeft;

  const RecentJobsCardItemModel({
    required this.title,
    required this.salary,
    required this.jobType,
    required this.company,
    required this.location,
    required this.timeLeft,
  });
}
