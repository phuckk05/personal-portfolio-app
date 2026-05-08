import 'package:flutter/material.dart';
import 'package:personal_portfolio/models/personal.dart';
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_strings.dart';
import 'package:personal_portfolio/utils/app_text_styles.dart';
import 'package:personal_portfolio/widgets/avatar_cus.dart';
import 'package:personal_portfolio/widgets/button_cus.dart';
import 'package:personal_portfolio/widgets/text_cus.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final String avatarPath = 'assets/images/avatar.jpg';
  final String tag = 'avatar';
  final Personal personal = Personal.mockPersonal;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            AppStrings.home,
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 100),
                  AvatarCus(
                    radius: 100,
                    imagePath: personal.avatarUrl,
                    tag: tag,
                  ),
                  SizedBox(height: 20),
                  TextCus(
                    text: personal.name,
                    textStyle: AppTextStyles.label.copyWith(
                      color: AppColors.chuChinh,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextCus(
                    text: personal.jobTitle,
                    textStyle: AppTextStyles.label.copyWith(
                      color: AppColors.chuChinh,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  ButtonCus(
                    isLoading: false,
                    width: ResponsiveBreakpoints.of(context).isMobile
                        ? double.infinity
                        : ResponsiveBreakpoints.of(context).isTablet
                        ? MediaQuery.of(context).size.width * 0.3
                        : MediaQuery.of(context).size.width * 0.2,
                    height: 50,
                    text: 'Download CV',
                    onPressed: () {
                      //Xử lý khi nhấn nút liên hệ
                    },
                    textStyle: AppTextStyles.bottomNavLabel.copyWith(
                      color: AppColors.chuChinh,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
