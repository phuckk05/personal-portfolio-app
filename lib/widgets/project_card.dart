import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_portfolio/models/project.dart';
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_strings.dart';
import 'package:personal_portfolio/utils/app_text_styles.dart';

class ProjectCard extends StatelessWidget {
  final double cardWidth;
  final Project project;
  const ProjectCard({
    super.key,
    required this.cardWidth,
    required this.project,
  });

  //hàm mở link github
  void _openGithubLink() {}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.nen,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.chuChinh.withOpacity(0.2)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _image(),
                SizedBox(height: 12),
                _title(),
                SizedBox(height: 8),
                _description(),
                SizedBox(height: 12),
                _technologies(),
                SizedBox(height: 12),
                _githubLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Ảnh đầu tiên của project
  Widget _image() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(project.screenshots.first),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  //Tên dự án
  Widget _title() {
    return Text(
      project.title,
      style: AppTextStyles.label.copyWith(
        color: AppColors.chuChinh,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  //mô tả
  Widget _description() {
    return Text(
      project.description,
      style: AppTextStyles.label.copyWith(
        color: AppColors.chuPhu,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      ),
    );
  }

  //các công nghệ sử dụng
  Widget _technologies() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: project.technologies
          .map((tech) => Chip(label: Text(tech)))
          .toList(),
    );
  }

  //guthub link
  Widget _githubLink() {
    if (project.githubUrl == null) return SizedBox.shrink();
    return TextButton.icon(
      style: TextButton.styleFrom(foregroundColor: AppColors.chuChinh),
      onPressed: () {
        //Mở link github
      },
      icon: SvgPicture.asset(
        AppStrings.svgGithub,
        width: 20,
        height: 20,
        color: AppColors.chuChinh,
      ),
      label: Text('Xem trên GitHub'),
    );
  }
}
