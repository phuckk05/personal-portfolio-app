import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_text_styles.dart';
import 'package:personal_portfolio/widgets/text_cus.dart';

/* tự định nghĩa 1 progress bar

  - svgPath: đường dẫn đến file svg
  - title: tiêu đề của progress bar
  - value: giá trị của progress bar
*/
class ProgressBarCus extends StatelessWidget {
  final String svgPath;
  final String title;
  final double value;
  const ProgressBarCus({
    super.key,
    required this.svgPath,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.oliveNau,
              borderRadius: BorderRadius.circular(6),
            ),
            child: SvgPicture.asset(svgPath, width: 20, height: 20),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          flex: 2,
          child: TextCus(
            text: title,
            textStyle: AppTextStyles.bottomNavLabel.copyWith(
              color: AppColors.chuChinh,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          flex: 7,
          child: Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: value,
                  color: AppColors.vangLuxury,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.vangLuxury,
                  ),
                  backgroundColor: AppColors.nen2,
                  borderRadius: BorderRadius.circular(12),
                  minHeight: 5,
                ),
              ),
              SizedBox(width: 8),
              TextCus(
                text: '${(value * 100).toStringAsFixed(0)}%',
                textStyle: AppTextStyles.bottomNavLabel.copyWith(
                  color: AppColors.chuChinh,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
