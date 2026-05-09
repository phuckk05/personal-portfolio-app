import 'package:flutter/material.dart';
import 'package:personal_portfolio/models/personal.dart';
import 'package:personal_portfolio/utils/animations/widget_animation.dart';
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_constants.dart';
import 'package:personal_portfolio/utils/app_strings.dart';
import 'package:personal_portfolio/utils/app_text_styles.dart';
import 'package:personal_portfolio/widgets/app_bar_cus.dart';
import 'package:personal_portfolio/widgets/avatar_cus.dart';
import 'package:personal_portfolio/widgets/button_cus.dart';
import 'package:personal_portfolio/widgets/text_cus.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final String avatarPath = AppStrings.avatarAssetPath;
  final String tag = AppStrings.avatarTag;
  final Personal personal = Personal.mockPersonal;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: CustomAppBar(title: AppStrings.home),
        //Sử dụng SingleChildScrollView để tránh lỗi khi nội dung quá dài và trường hợp user co thắt giao diện
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.spacingM,
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: AppConstants.size100),
                  WidgetAnimation(
                    beginOffset: const Offset(
                      0,
                      AppConstants.animationOffsetLargeY,
                    ),
                    delay: const Duration(
                      milliseconds: AppConstants.homeAnimationDelayMs,
                    ),
                    child: AvatarCus(
                      semanticsLabel: AppStrings.avatarSemanticsLabel,
                      radius: AppConstants.size100,
                      imagePath: personal.avatarUrl,
                      tag: tag,
                    ),
                  ),
                  SizedBox(height: AppConstants.spacingXL),
                  WidgetAnimation(
                    beginOffset: const Offset(
                      AppConstants.animationOffsetLargeX,
                      0,
                    ),
                    delay: const Duration(
                      milliseconds: AppConstants.homeAnimationDelayMs,
                    ),
                    child: TextCus(
                      text: personal.name,
                      textStyle: AppTextStyles.label.copyWith(
                        color: Theme.of(context).appBarTheme.foregroundColor!,
                        fontWeight: FontWeight.bold,
                        fontSize: AppConstants.fontSize2XL,
                      ),
                    ),
                  ),
                  SizedBox(height: AppConstants.spacingSM),
                  WidgetAnimation(
                    beginOffset: const Offset(
                      -AppConstants.animationOffsetLargeX,
                      0,
                    ),
                    delay: const Duration(
                      milliseconds: AppConstants.homeAnimationDelayMs,
                    ),
                    child: TextCus(
                      text: personal.jobTitle,
                      textStyle: AppTextStyles.label.copyWith(
                        color: Theme.of(context).appBarTheme.foregroundColor!,
                        fontWeight: FontWeight.bold,
                        fontSize: AppConstants.fontSizeL,
                      ),
                    ),
                  ),
                  SizedBox(height: AppConstants.spacingXL),
                  WidgetAnimation(
                    beginOffset: const Offset(
                      AppConstants.animationOffsetLargeX,
                      0,
                    ),
                    delay: const Duration(
                      milliseconds: AppConstants.homeAnimationDelayMs,
                    ),
                    child: ButtonCus(
                      backgroundColor: Theme.of(
                        context,
                      ).appBarTheme.foregroundColor!,
                      textColor: Theme.of(context).appBarTheme.backgroundColor!,
                      isLoading: false,
                      width: ResponsiveBreakpoints.of(context).isMobile
                          ? double.infinity
                          : ResponsiveBreakpoints.of(context).isTablet
                          ? MediaQuery.of(context).size.width *
                                AppConstants.homeButtonTabletWidthFactor
                          : MediaQuery.of(context).size.width *
                                AppConstants.homeButtonDesktopWidthFactor,
                      height: AppConstants.size50,
                      text: AppStrings.downloadCv,
                      onPressed: () {
                        //Xử lý khi nhấn nút liên hệ
                      },
                      textStyle: AppTextStyles.bottomNavLabel.copyWith(
                        color: Theme.of(context).appBarTheme.foregroundColor!,
                        fontWeight: FontWeight.bold,
                        fontSize: AppConstants.fontSizeXL,
                      ),
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
