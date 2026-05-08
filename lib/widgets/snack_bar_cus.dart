import 'package:flutter/material.dart';
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_text_styles.dart';
import 'package:personal_portfolio/widgets/text_cus.dart';

class SnackBarCus {
  static void show(BuildContext context, {required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.chuPhu,
        content: Center(
          child: TextCus(text: text, textStyle: AppTextStyles.label),
        ),
      ),
    );
  }
}
