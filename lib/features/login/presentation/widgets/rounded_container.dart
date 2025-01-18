import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Color? color;
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final double? height;
  const RoundedContainer({
    super.key,
    this.color,
    required this.child,
    this.onTap,
    this.padding,
    this.margin,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        padding: padding ?? const EdgeInsets.all(12),
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(4, 4),
                blurRadius: 8,
                spreadRadius: 1),
          ],
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
    );
  }
}
