import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

//Widget animation chuyển màn hình
class PageAnimation extends StatelessWidget {
  final Widget child;

  const PageAnimation({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      duration: const Duration(milliseconds: 500),

      transitionBuilder:
          (
            Widget child,
            Animation<double> primaryAnimation,
            Animation<double> secondaryAnimation,
          ) {
            return FadeThroughTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              fillColor: Colors.transparent,
              child: child,
            );
          },

      child: child,
    );
  }
}
