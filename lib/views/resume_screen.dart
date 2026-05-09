import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_portfolio/cubits/side_menu_display_mode_cubit.dart';
import 'package:personal_portfolio/models/personal.dart';
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_constants.dart';
import 'package:personal_portfolio/utils/app_strings.dart';
import 'package:personal_portfolio/utils/app_text_styles.dart';
import 'package:personal_portfolio/widgets/app_bar_cus.dart';
import 'package:personal_portfolio/widgets/avatar_cus.dart';
import 'package:personal_portfolio/widgets/text_crad_cus.dart';
import 'package:personal_portfolio/widgets/text_cus.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResumeScreen extends StatelessWidget {
  ResumeScreen({super.key});

  final personal = Personal.mockPersonal;
  final String tag = AppStrings.avatarTag;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: CustomAppBar(title: AppStrings.resume),
        //Sử dụng SingleChildScrollView để tránh lỗi khi nội dung quá dài và trường hợp user co thắt giao diện
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.spacingM,
              ),
              child: Column(
                children: [
                  ResponsiveBreakpoints.of(context).isMobile
                      ? SizedBox.shrink()
                      : SizedBox(height: AppConstants.resumeTopSpacerDesktop),
                  _buildInformation(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //build thông tin cá nhân
  Widget _buildInformation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextCus(
          text: AppStrings.resumePersonalInfoTitle,
          textStyle: AppTextStyles.label.copyWith(
            color: Theme.of(context).appBarTheme.foregroundColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spacingM,
            vertical: AppConstants.spacingLG,
          ),
          child: SizedBox(
            width: ResponsiveBreakpoints.of(context).isMobile
                ? double.infinity
                : ResponsiveBreakpoints.of(context).isTablet
                ? double.infinity
                : MediaQuery.of(context).size.width *
                      AppConstants.resumeDesktopWidthFactor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextCus(
                        text: AppStrings.resumeGreeting,
                        textStyle: AppTextStyles.label.copyWith(
                          color: Theme.of(context).appBarTheme.foregroundColor!,
                          fontWeight: FontWeight.bold,
                          fontSize: AppConstants.fontSizeL,
                        ),
                      ),
                      SizedBox(height: AppConstants.spacingSM),
                      TextCus(
                        text: personal.resume.firstName,
                        textStyle: AppTextStyles.label.copyWith(
                          color: AppColors.vangLuxury,
                          fontWeight: FontWeight.bold,
                          fontSize: AppConstants.fontSize2XL,
                        ),
                      ),
                      TextCus(
                        text: personal.resume.lastName,
                        textStyle: AppTextStyles.label.copyWith(
                          color: Theme.of(context).appBarTheme.foregroundColor!,
                          fontWeight: FontWeight.bold,
                          fontSize: AppConstants.fontSize2XL,
                        ),
                      ),
                      SizedBox(height: AppConstants.spacingSM),
                      TextCradCus(
                        text: personal.resume.jobTitle,
                        textStyle: AppTextStyles.bottomNavLabel.copyWith(
                          color: Theme.of(context).appBarTheme.backgroundColor,
                          fontWeight: FontWeight.bold,
                          fontSize: AppConstants.fontSizeSM,
                        ),
                        backgroundColor: Theme.of(
                          context,
                        ).appBarTheme.foregroundColor!,
                        borderColor: AppColors.vangLuxury,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: AppConstants.spacingM),
                BlocBuilder<SideMenuDisplayModeCubit, SideMenuDisplayMode>(
                  builder: (context, state) {
                    return AvatarCus(
                      semanticsLabel: AppStrings.avatarSemanticsLabel,
                      radius:
                          ResponsiveBreakpoints.of(context).isMobile ||
                              ResponsiveBreakpoints.of(context).isTablet
                          ? state == SideMenuDisplayMode.open
                                ? ResponsiveBreakpoints.of(context).isMobile
                                      ? MediaQuery.of(context).size.width *
                                            AppConstants
                                                .resumeAvatarRadiusMobileOpenFactor
                                      : MediaQuery.of(context).size.width *
                                            AppConstants
                                                .resumeAvatarRadiusTabletOpenFactor
                                : MediaQuery.of(context).size.width *
                                      AppConstants
                                          .resumeAvatarRadiusClosedFactor
                          : AppConstants.resumeAvatarRadiusDesktop,
                      imagePath: personal.avatarUrl,
                      tag: tag,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        TextCus(
          text: AppStrings.resumeCareerGoalTitle,
          textStyle: AppTextStyles.label.copyWith(
            color: Theme.of(context).appBarTheme.foregroundColor!,
          ),
        ),
        SizedBox(height: AppConstants.spacingM),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spacingM,
          ),
          child: TextCus(
            text: personal.resume.careerGoal,
            textStyle: AppTextStyles.label.copyWith(
              color: Theme.of(context).appBarTheme.foregroundColor!,
              fontSize: AppConstants.fontSizeSM,
              height: AppConstants.resumeTextLineHeight,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        SizedBox(height: AppConstants.spacingM),
        TextCus(
          text: AppStrings.resumeEducationTitle,
          textStyle: AppTextStyles.label.copyWith(
            color: Theme.of(context).appBarTheme.foregroundColor!,
          ),
        ),
        SizedBox(height: AppConstants.spacingM),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spacingM,
          ),
          child: Column(
            children: [
              TextCus(
                text: personal.resume.education,
                textStyle: AppTextStyles.label.copyWith(
                  color: Theme.of(context).appBarTheme.foregroundColor!,
                  fontSize: AppConstants.fontSizeSM,
                  height: AppConstants.resumeTextLineHeight,
                  fontStyle: FontStyle.italic,
                ),
              ),
              // TextCus(
              //   text: personal.resume.workExperience,
              //   textStyle: AppTextStyles.label.copyWith(
              //     color: Theme.of(context).appBarTheme.foregroundColor!,
              //     fontSize: 14,
              //     height: 1.5,
              //     fontStyle: FontStyle.italic,
              //   ),
              // ),
            ],
          ),
        ),

        SizedBox(height: AppConstants.spacingM),
        TextCus(
          text: AppStrings.resumeWorkExperienceTitle,
          textStyle: AppTextStyles.label.copyWith(
            color: Theme.of(context).appBarTheme.foregroundColor!,
          ),
        ),
        SizedBox(height: AppConstants.spacingM),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spacingM,
          ),
          child: TextCus(
            text: personal.resume.workExperience,
            textStyle: AppTextStyles.label.copyWith(
              color: Theme.of(context).appBarTheme.foregroundColor!,
              fontSize: AppConstants.fontSizeSM,
              height: AppConstants.resumeTextLineHeight,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}
