import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_portfolio/cubits/selected_chip_cubit.dart';
import 'package:personal_portfolio/models/personal.dart';
import 'package:personal_portfolio/models/project.dart';
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_constants.dart';
import 'package:personal_portfolio/utils/app_strings.dart';
import 'package:personal_portfolio/utils/app_text_styles.dart';
import 'package:personal_portfolio/widgets/app_bar_cus.dart';
import 'package:personal_portfolio/widgets/hover_container_cus.dart';
import 'package:personal_portfolio/widgets/project_card.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class ProjectsScreen extends StatelessWidget {
  ProjectsScreen({super.key});

  final ScrollController scrollController = ScrollController();

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
        ? (width - AppConstants.projectsTabletGutter) /
              AppConstants.projectsTabletColumns
        : (width - AppConstants.projectsDesktopGutter) /
              AppConstants.projectsDesktopColumns;
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.projects),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: AppConstants.spacingXL),
            _technologies(technologies),
            SizedBox(height: AppConstants.spacingXL),
            Expanded(
              child: BlocBuilder<SelectedChipCubit, String?>(
                builder: (context, selectedChip) {
                  final projects =
                      selectedChip == null ||
                          selectedChip == AppStrings.projectsAllFilter
                      ? ProjectMockData.getSampleProjects()
                      : ProjectMockData.getSampleProjects()
                            .where(
                              (project) =>
                                  project.technologies.contains(selectedChip),
                            )
                            .toList();
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.spacingM,
                    ),
                    child: WebSmoothScroll(
                      scrollOffset: 100,
                      animationDuration: 600,
                      curve: Curves.easeInOut,
                      controller: scrollController,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        physics: BouncingScrollPhysics(),
                        child: Wrap(
                          spacing: AppConstants.spacingXL,
                          runSpacing: AppConstants.spacingXL,

                          children: projects
                              .map(
                                (project) => HoverContainer(
                                  backgroundColor: Theme.of(
                                    context,
                                  ).appBarTheme.backgroundColor!,
                                  hoverColor: Theme.of(context)
                                      .appBarTheme
                                      .foregroundColor!
                                      .withOpacity(
                                        AppConstants.hoverOpacityLow,
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
    final techList = {AppStrings.projectsAllFilter, ...technologies};
    return BlocBuilder<SelectedChipCubit, String?>(
      builder: (context, selectedChip) {
        return Wrap(
          spacing: AppConstants.spacingS,
          runSpacing: AppConstants.spacingS,
          children: techList
              .map(
                (tech) => HoverContainer(
                  onTap: () {
                    context.read<SelectedChipCubit>().selectChip(tech);
                  },
                  backgroundColor: selectedChip == tech
                      ? Theme.of(context).appBarTheme.foregroundColor!
                      : Theme.of(context).appBarTheme.foregroundColor!
                            .withOpacity(AppConstants.hoverOpacitySubtle),
                  hoverColor: Theme.of(context).appBarTheme.foregroundColor!
                      .withOpacity(AppConstants.hoverOpacityHigh),
                  borderRadius: AppConstants.radiusM,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.spacingM,
                    vertical: AppConstants.spacingXXS,
                  ),
                  child: Text(
                    tech,
                    style: AppTextStyles.label.copyWith(
                      fontSize: AppConstants.fontSizeM,
                      color: selectedChip == tech
                          ? Theme.of(context).appBarTheme.backgroundColor!
                          : Theme.of(context).appBarTheme.foregroundColor!,
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
