import 'package:flutter/material.dart';
import 'package:personal_portfolio/utils/app_colors.dart';

/* tự định nghĩa 1 avatar

  - radius: bán kính của avatar
  - imagePath: đường dẫn đến ảnh avatar
  - tag: tag để sử dụng cho hero animation
*/
class AvatarCus extends StatelessWidget {
  final double radius;
  final String imagePath;
  final String tag;
  const AvatarCus({
    super.key,
    required this.radius,
    required this.imagePath,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.vangLuxury, width: 2),
        ),
        child: CircleAvatar(
          radius: radius,
          backgroundImage: AssetImage(imagePath),
        ),
      ),
    );
  }
}
