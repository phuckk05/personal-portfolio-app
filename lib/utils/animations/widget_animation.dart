import 'package:flutter/material.dart';

//* Tự định nghĩa animation cho widget
//
//
// */
class WidgetAnimation extends StatelessWidget {
  final Widget child;

  // hướng animation
  final Offset beginOffset;

  // thời gian animation
  final Duration duration;

  // delay
  final Duration delay;

  const WidgetAnimation({
    super.key,
    required this.child,
    this.beginOffset = const Offset(0, 0.1),
    this.duration = const Duration(milliseconds: 700),
    this.delay = Duration.zero,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),

      duration: duration + delay,

      curve: Curves.easeOutCubic,

      builder: (context, value, child) {
        // fade
        final opacity = value;

        // slide
        final offset = Offset(
          beginOffset.dx * (1 - value) * 100,
          beginOffset.dy * (1 - value) * 100,
        );

        // scale nhẹ
        final scale = 0.95 + (0.05 * value);

        return Opacity(
          opacity: opacity,

          child: Transform.translate(
            offset: offset,

            child: Transform.scale(scale: scale, child: child),
          ),
        );
      },

      child: child,
    );
  }
}
