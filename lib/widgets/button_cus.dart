import 'package:flutter/material.dart';
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_text_styles.dart';
import 'package:personal_portfolio/widgets/loading_internal.dart';

/* Tự định nghĩa 1 button
  
  - text: nội dung hiển thị trên button
  - onPressed: hàm được gọi khi button được nhấn
  - backgroundColor: màu nền của button
  - textColor: màu chữ của button

*/

class ButtonCus extends StatelessWidget {
  final bool isLoading;
  final double? width;
  final double? height;
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  const ButtonCus({
    super.key,
    required this.isLoading,
    required this.text,
    required this.width,
    required this.height,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    required TextStyle textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Button: $text',
      child: SizedBox(
        height: height ?? 50,
        width: width ?? double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            disabledBackgroundColor: AppColors.chuPhu,
            backgroundColor: backgroundColor ?? AppColors.chuChinh,
            foregroundColor: textColor ?? AppColors.nen,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: isLoading == true
              ? LoadingInternal(color: AppColors.nen, loading: isLoading)
              : Text(
                  text,
                  style: AppTextStyles.bottomNavLabel.copyWith(
                    color: textColor ?? AppColors.nen,
                  ),
                ),
        ),
      ),
    );
  }
}
