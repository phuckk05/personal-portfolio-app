import 'package:flutter/material.dart';
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_text_styles.dart';

/* tự định nghĩa 1 text card

  - text: nội dung hiển thị trên card
  - textStyle: style của text
  - backgroundColor: màu nền của card
  - borderColor: màu viền của card
*/
class TextCradCus extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  const TextCradCus({
    super.key,
    required this.text,
    this.textStyle,
    this.backgroundColor,
    this.borderColor = AppColors.chuChinh,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: borderColor ?? AppColors.chuChinh),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style:
              textStyle ??
              AppTextStyles.bottomNavLabel.copyWith(color: AppColors.chuChinh),
        ),
      ),
    );
  }
}
