import 'package:flutter/material.dart';

/* Tạo hiệu ứng hover */
class HoverContainer extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;

  final Color backgroundColor;
  final Color hoverColor;

  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Duration duration;

  const HoverContainer({
    super.key,
    required this.child,
    this.onTap,
    required this.backgroundColor,
    required this.hoverColor,
    this.borderRadius = 20,
    this.padding = const EdgeInsets.all(12),
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  State<HoverContainer> createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHover = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: widget.duration,
          padding: widget.padding,
          decoration: BoxDecoration(
            color: isHover ? widget.hoverColor : widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            boxShadow: isHover
                ? [
                    BoxShadow(
                      blurRadius: 12,
                      spreadRadius: 1,
                      offset: const Offset(0, 4),
                      color: Colors.black.withOpacity(0.08),
                    ),
                  ]
                : [],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
