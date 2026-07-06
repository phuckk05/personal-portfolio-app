import 'package:personal_portfolio/models/progress_bar.dart';
import 'package:personal_portfolio/models/project.dart';
import 'package:personal_portfolio/models/resume.dart';

class Personal {
  final String name;
  final String jobTitle;
  final String avatarUrl;

  final Resume resume;
  final List<Project> project;
  final List<ProgressBar> progressBar;

  Personal({
    required this.name,
    required this.jobTitle,
    required this.avatarUrl,

    required this.resume,
    required this.project,
    required this.progressBar,
  });

  //Mock data cá nhân
  static final mockPersonal = Personal(
    name: "Nguyễn Đình Phúc",
    jobTitle: "Flutter Developer",
    avatarUrl: "assets/images/gabil.png",
    resume: Resume.getSampleResume(),
    project: ProjectMockData.getSampleProjects(),
    progressBar: ProgressBar.list,
  );
}
