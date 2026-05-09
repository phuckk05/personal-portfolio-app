import 'package:flutter/material.dart';
import 'package:personal_portfolio/utils/app_colors.dart';

/* tự định nghĩa 1 avatar

  - radius: bán kính của avatar
  - imagePath: đường dẫn đến ảnh avatar
  - tag: tag để sử dụng cho hero animation
*/
class AvatarCus extends StatelessWidget {
  final String semanticsLabel;
  final double radius;
  final String imagePath;
  final String tag;
  const AvatarCus({
    super.key,
    required this.semanticsLabel,
    required this.radius,
    required this.imagePath,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticsLabel,
      child: Hero(
        tag: tag,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.vangLuxury, width: 2),
          ),
          child: ClipOval(
            child: Image.asset(
              imagePath,

              width: radius * 2,
              height: radius * 2,

              fit: BoxFit.cover,

              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: radius * 2,
                  height: radius * 2,

                  color: Colors.grey.shade900,

                  child: const Icon(Icons.person, color: Colors.white),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
