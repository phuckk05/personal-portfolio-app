import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_portfolio/cubits/side_menu_display_mode_cubit.dart';
import 'package:personal_portfolio/models/personal.dart';
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_strings.dart';
import 'package:personal_portfolio/utils/app_text_styles.dart';
import 'package:personal_portfolio/widgets/avatar_cus.dart';
import 'package:personal_portfolio/widgets/text_crad_cus.dart';
import 'package:personal_portfolio/widgets/text_cus.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResumeScreen extends StatelessWidget {
  ResumeScreen({super.key});

  final personal = Personal.mockPersonal;
  final String tag = 'avatar';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.nen,
          title: Text(
            AppStrings.resume,
            style: AppTextStyles.bottomNavLabel.copyWith(
              color: AppColors.chuChinh,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        //Sử dụng SingleChildScrollView để tránh lỗi khi nội dung quá dài và trường hợp user co thắt giao diện
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [SizedBox(height: 100), _buildInformation(context)],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //build thông tin cá nhận
  Widget _buildInformation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextCus(
          text: 'Thông tin cá nhân',
          textStyle: AppTextStyles.label.copyWith(color: AppColors.chuChinh),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          child: SizedBox(
            width: ResponsiveBreakpoints.of(context).isMobile
                ? double.infinity
                : ResponsiveBreakpoints.of(context).isTablet
                ? double.infinity
                : MediaQuery.of(context).size.width * 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextCus(
                      text: "Hi, I'm",
                      textStyle: AppTextStyles.label.copyWith(
                        color: AppColors.chuChinh,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextCus(
                      text: personal.resume.firstName,
                      textStyle: AppTextStyles.label.copyWith(
                        color: AppColors.chuChinh,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    TextCus(
                      text: personal.resume.lastName,
                      textStyle: AppTextStyles.label.copyWith(
                        color: AppColors.vangLuxury,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextCradCus(
                      text: personal.resume.jobTitle,
                      textStyle: AppTextStyles.bottomNavLabel.copyWith(
                        color: AppColors.chuChinh,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      backgroundColor: AppColors.nen2,
                      borderColor: AppColors.vangLuxury,
                    ),
                  ],
                ),
                SizedBox(width: 12),
                BlocBuilder<SideMenuDisplayModeCubit, SideMenuDisplayMode>(
                  builder: (context, state) {
                    return AvatarCus(
                      radius:
                          ResponsiveBreakpoints.of(context).isMobile ||
                              ResponsiveBreakpoints.of(context).isTablet
                          ? state == SideMenuDisplayMode.open
                                ? ResponsiveBreakpoints.of(context).isMobile
                                      ? MediaQuery.of(context).size.width * 0.15
                                      : MediaQuery.of(context).size.width * 0.06
                                : MediaQuery.of(context).size.width * 0.2
                          : 100,
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
          text: 'Mục tiêu nghề nghiệp',
          textStyle: AppTextStyles.label.copyWith(color: AppColors.chuChinh),
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextCus(
            text: personal.resume.careerGoal,
            textStyle: AppTextStyles.label.copyWith(
              color: AppColors.chuPhu,
              fontSize: 14,
              height: 1.5,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        SizedBox(height: 12),
        TextCus(
          text: 'Học vấn',
          textStyle: AppTextStyles.label.copyWith(color: AppColors.chuChinh),
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              TextCus(
                text: personal.resume.education,
                textStyle: AppTextStyles.label.copyWith(
                  color: AppColors.chuPhu,
                  fontSize: 14,
                  height: 1.5,
                  fontStyle: FontStyle.italic,
                ),
              ),
              // TextCus(
              //   text: personal.resume.workExperience,
              //   textStyle: AppTextStyles.label.copyWith(
              //     color: AppColors.chuPhu,
              //     fontSize: 14,
              //     height: 1.5,
              //     fontStyle: FontStyle.italic,
              //   ),
              // ),
            ],
          ),
        ),

        SizedBox(height: 12),
        TextCus(
          text: 'Kinh nghiệm làm việc',
          textStyle: AppTextStyles.label.copyWith(color: AppColors.chuChinh),
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextCus(
            text: personal.resume.workExperience,
            textStyle: AppTextStyles.label.copyWith(
              color: AppColors.chuPhu,
              fontSize: 14,
              height: 1.5,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}
