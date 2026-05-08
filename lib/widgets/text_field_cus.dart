import 'package:flutter/material.dart';
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_text_styles.dart';

/* Tự định nghĩa 1 text field 
  - controller: bộ điều khiển của text field
  - hintText: nội dung gợi ý trong text field
  - labelText: nội dung tiêu đề của text field
  - obscureText: ẩn nội dung trong text field
  - maxLength: độ dài tối đa của nội dung trong text field
  - maxLines: số dòng tối đa của nội dung trong text field
  - minLines: số dòng tối thiểu của nội dung trong text field
*/

class TextFieldCus extends StatelessWidget {
  final double width;
  final double height;
  final TextEditingController? controller;
  final String hintText;
  final bool? obscureText;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final TextInputType? textInputType;
  final Color? textColor;
  final double? borderRadius;
  final IconData? suffixIcon;
  const TextFieldCus({
    super.key,
    required this.width,
    required this.height,
    this.controller,
    required this.hintText,
    this.obscureText,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.textInputType,
    this.textColor,
    this.borderRadius,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        controller: controller,
        obscureText: obscureText ?? false,
        maxLength: maxLength,
        maxLines: maxLines ?? 1,
        minLines: minLines ?? 1,
        keyboardType: textInputType,
        style: AppTextStyles.label.copyWith(
          color: textColor ?? AppColors.chuChinh,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
            borderSide: BorderSide(color: AppColors.chuChinh),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
            borderSide: BorderSide(color: AppColors.chuChinh),
          ),
          hintStyle: AppTextStyles.bottomNavLabel.copyWith(
            color:
                textColor?.withOpacity(0.7) ??
                AppColors.chuChinh.withOpacity(0.7),
            fontWeight: FontWeight.bold,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          suffixIcon: suffixIcon != null
              ? Icon(suffixIcon, color: Colors.red)
              : null,
        ),
      ),
    );
  }
}
