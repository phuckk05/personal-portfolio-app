class Project {
  final String id;
  final String title;
  final String description;
  final List<String> screenshots;
  final List<String> technologies;
  final String? githubUrl;
  final ProjectType type;
  final DateTime startDate;
  final DateTime? endDate;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.screenshots,
    required this.technologies,
    this.githubUrl,
    required this.type,
    required this.startDate,
    this.endDate,
  });
}

enum ProjectType { personal, team }

class ProjectMockData {
  static List<Project> getSampleProjects() {
    return [
      Project(
        id: '1',
        title: 'E-Commerce Mobile App',
        description:
            'Ứng dụng mua sắm trực tuyến với tích hợp thanh toán, giỏ hàng, và quản lý đơn hàng. Hỗ trợ đa ngôn ngữ và theme tối/sáng.',
        screenshots: ['assets/images/avatar.jpg'],
        technologies: [
          'Flutter',
          'Bloc',
          'Firebase',
          'Stripe Payment',
          'REST API',
        ],
        githubUrl: 'https://github.com/username/ecommerce-app',
        type: ProjectType.personal,
        startDate: DateTime(2023, 6, 1),
        endDate: DateTime(2023, 12, 15),
      ),

      Project(
        id: '2',
        title: 'Task Management System',
        description:
            'Hệ thống quản lý công việc cho team với Kanban board, phân quyền user, và báo cáo tiến độ.',
        screenshots: [
          'assets/projects/task_1.png',
          'assets/projects/task_2.png',
        ],
        technologies: ['Flutter', 'GetX', 'Node.js', 'MongoDB', 'Socket.io'],
        githubUrl: 'https://github.com/team/task-manager',
        type: ProjectType.team,
        startDate: DateTime(2024, 1, 10),
        endDate: null, // Đang làm
      ),

      Project(
        id: '3',
        title: 'Fitness Tracker',
        description:
            'App theo dõi sức khỏe với tích hợp sensors, charts, và AI recommendation cho workout plans.',
        screenshots: [
          'assets/projects/fitness_1.png',
          'assets/projects/fitness_2.png',
          'assets/projects/fitness_3.png',
        ],
        technologies: [
          'Flutter',
          'Provider',
          'SQLite',
          'Charts',
          'Wearable API',
        ],
        githubUrl: 'https://github.com/username/fitness-tracker',
        type: ProjectType.personal,
        startDate: DateTime(2023, 3, 1),
        endDate: DateTime(2023, 8, 20),
      ),
    ];
  }
}
