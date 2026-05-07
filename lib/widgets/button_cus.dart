import 'package:flutter/material.dart';
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_text_styles.dart';

/* Tự định nghĩa 1 button
  
  - text: nội dung hiển thị trên button
  - onPressed: hàm được gọi khi button được nhấn
  - backgroundColor: màu nền của button
  - textColor: màu chữ của button

*/

class ButtonCus extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  const ButtonCus({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: backgroundColor ?? AppColors.chuChinh,
        foregroundColor: textColor ?? AppColors.nen,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        text,
        style: AppTextStyles.bottomNavLabel.copyWith(
          color: textColor ?? AppColors.nen,
        ),
      ),
    );
  }
}
