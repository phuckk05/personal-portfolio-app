import 'package:flutter/material.dart';
import 'package:personal_portfolio/models/personal.dart';
import 'package:personal_portfolio/utils/app_constants.dart';
import 'package:personal_portfolio/utils/app_strings.dart';
import 'package:personal_portfolio/widgets/app_bar_cus.dart';
import 'package:personal_portfolio/widgets/progress_bar_cus.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.home),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.spacingM,
          vertical: AppConstants.spacingM,
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            width:
                ResponsiveBreakpoints.of(context).isMobile ||
                    ResponsiveBreakpoints.of(context).isTablet
                ? double.infinity
                : MediaQuery.of(context).size.width *
                      AppConstants.skillsDesktopWidthFactor,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: Personal.mockPersonal.progressBar.length,
              itemBuilder: (context, index) {
                final progressBar = Personal.mockPersonal.progressBar[index];
                return ProgressBarCus(
                  svgPath: progressBar.svgPath,
                  title: progressBar.title,
                  value: progressBar.value,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: AppConstants.spacingM);
              },
            ),
          ),
        ),
      ),
    );
  }
}
