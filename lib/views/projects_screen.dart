import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_portfolio/cubits/selected_chip_cubit.dart';
import 'package:personal_portfolio/models/personal.dart';
import 'package:personal_portfolio/models/project.dart';
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_strings.dart';
import 'package:personal_portfolio/utils/app_text_styles.dart';
import 'package:personal_portfolio/widgets/hover_container_cus.dart';
import 'package:personal_portfolio/widgets/project_card.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProjectsScreen extends StatelessWidget {
  ProjectsScreen({super.key});

  //lấy các công nghệ của project để hiển thị ở
  final Set<String> technologies = Personal.mockPersonal.project
      .toList()
      .expand((project) => project.technologies)
      .toSet();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final cardWidth = ResponsiveBreakpoints.of(context).isMobile
        ? double.infinity
        : ResponsiveBreakpoints.of(context).isTablet
        ? (width - 100) / 2
        : (width - 200) / 3;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.projects,
          style: AppTextStyles.bottomNavLabel.copyWith(
            color: AppColors.chuChinh,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            _technologies(technologies),
            SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<SelectedChipCubit, String?>(
                builder: (context, selectedChip) {
                  final projects =
                      selectedChip == null || selectedChip == "Tất cả"
                      ? ProjectMockData.getSampleProjects()
                      : ProjectMockData.getSampleProjects()
                            .where(
                              (project) =>
                                  project.technologies.contains(selectedChip),
                            )
                            .toList();
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,

                        children: projects
                            .map(
                              (project) => HoverContainer(
                                backgroundColor: AppColors.nen,
                                hoverColor: AppColors.chuChinh.withOpacity(
                                  0.15,
                                ),
                                child: ProjectCard(
                                  cardWidth: cardWidth,
                                  project: project,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _technologies(Set<String> technologies) {
    final techList = {"Tất cả", ...technologies};
    return BlocBuilder<SelectedChipCubit, String?>(
      builder: (context, selectedChip) {
        return Wrap(
          spacing: 8,
          runSpacing: 8,
          children: techList
              .map(
                (tech) => HoverContainer(
                  onTap: () {
                    context.read<SelectedChipCubit>().selectChip(tech);
                  },
                  backgroundColor: selectedChip == tech
                      ? AppColors.chuChinh
                      : AppColors.chuChinh.withOpacity(0.1),
                  hoverColor: AppColors.chuChinh.withOpacity(0.3),
                  borderRadius: 12,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: Text(
                    tech,
                    style: AppTextStyles.label.copyWith(
                      fontSize: 16,
                      color: selectedChip == tech
                          ? AppColors.nen
                          : AppColors.chuChinh,
                      fontWeight: selectedChip == tech
                          ? FontWeight.bold
                          : FontWeight.w500,
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
