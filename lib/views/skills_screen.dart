import 'package:flutter/material.dart';
import 'package:personal_portfolio/models/personal.dart';
import 'package:personal_portfolio/models/progress_bar.dart';
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_strings.dart';
import 'package:personal_portfolio/utils/app_text_styles.dart';
import 'package:personal_portfolio/widgets/progress_bar_cus.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.nen,
        title: Text(
          AppStrings.skills,
          style: AppTextStyles.bottomNavLabel.copyWith(
            color: AppColors.chuChinh,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: SingleChildScrollView(
          child: SizedBox(
            width:
                ResponsiveBreakpoints.of(context).isMobile ||
                    ResponsiveBreakpoints.of(context).isTablet
                ? double.infinity
                : MediaQuery.of(context).size.width * 0.4,
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
                return const SizedBox(height: 12);
              },
            ),
          ),
        ),
      ),
    );
  }
}
