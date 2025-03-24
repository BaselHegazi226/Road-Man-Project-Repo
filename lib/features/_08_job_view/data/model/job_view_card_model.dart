class JobViewCardModel {
  final String title;
  final String salary, subscriptionType;
  final String jobType;
  final String company, location;
  final String logo;
  final String? timeLeft;
  final String? jobLevel;
  const JobViewCardModel({
    this.timeLeft,
    this.jobLevel,
    required this.title,
    required this.salary,
    required this.subscriptionType,
    required this.jobType,
    required this.company,
    required this.location,
    required this.logo,
  });
}
