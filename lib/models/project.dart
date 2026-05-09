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
        title: 'Ứng dụng cá nhân hồ sơ',
        description:
            'Ứng dụng hồ sơ cá nhân với Flutter, tích hợp Firebase cho authentication và Cloudinary để quản lý ảnh và các widget.',
        screenshots: ['assets/images/widget-social.png'],
        technologies: ['Flutter', 'Firebase', 'Authentication', 'Cloudinary'],
        githubUrl: 'https://github.com/phuckk05/widgets-app',
        type: ProjectType.personal,
        startDate: DateTime(2023, 6, 1),
        endDate: DateTime(2023, 12, 15),
      ),

      Project(
        id: '2',
        title: 'Ứng dụng quản lý nhà hàng thông minh',
        description:
            'Đã phát triển ứng dụng quản lý nhà hàng thông minh với Flutter, tích hợp Spring Boot cho backend, Render để triển khai, Supabase cho cơ sở dữ liệu, Cloudinary để quản lý ảnh và REST API để giao tiếp giữa frontend và backend.',
        screenshots: ['assets/images/smart-dine-1.png'],
        technologies: [
          'Flutter',
          'Spring boot',
          'Render',
          'Supabase',
          'Cloudinary',
          'REST API',
        ],
        githubUrl: 'https://github.com/phuckk05/SmartDine_Frontend',
        type: ProjectType.team,
        startDate: DateTime(2024, 1, 10),
        endDate: null, // Đang làm
      ),

      Project(
        id: '3',
        title: 'Tìm đồ thất lạc',
        description:
            'App tìm kiếm đồ vật thất lạc với tích hợp bản đồ, và AI để hỗ trợ người dùng.',
        screenshots: ['assets/images/finback-1.png'],
        technologies: ['Kotlin', 'Osdroid map', 'Firebase', 'DeepLinking'],
        githubUrl: 'https://github.com/phuckk05/FindBack',
        type: ProjectType.personal,
        startDate: DateTime(2023, 3, 1),
        endDate: DateTime(2023, 8, 20),
      ),
    ];
  }
}
