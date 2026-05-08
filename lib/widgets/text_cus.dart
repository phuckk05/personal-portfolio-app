import 'package:flutter/material.dart';
import 'package:personal_portfolio/utils/app_text_styles.dart';

/* Tự định nghĩa 1 text
  
  - text: nội dung hiển thị trên text
  - textStyle: style của text

*/
class TextCus extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  const TextCus({super.key, required this.text, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: textStyle ?? AppTextStyles.label);
  }
}
