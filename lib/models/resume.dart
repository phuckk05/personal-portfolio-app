class Resume {
  final String firstName;
  final String lastName;
  final String jobTitle;
  final String careerGoal;
  final String education;
  final String workExperience;

  Resume({
    required this.firstName,
    required this.lastName,
    required this.jobTitle,
    required this.careerGoal,
    required this.education,
    required this.workExperience,
  });

  static Resume getSampleResume() {
    return Resume(
      firstName: "Nguyễn",
      lastName: "Đình Phúc",
      jobTitle: "Thực tập sinh Flutter Developer",
      careerGoal:
          "Tôi mong muốn trở thành một Flutter Developer chuyên nghiệp, đóng góp vào các dự án sáng tạo và phát triển ứng dụng di động chất lượng cao, có ích cho cộng đồng.",
      workExperience: "Chưa có kinh nghiệm làm việc.",
      education:
          "Chuyên ngành Khoa học Máy tính.\n"
          "Trường cao đẳng Cộng nghệ Thủ Đức.",
    );
  }
}
