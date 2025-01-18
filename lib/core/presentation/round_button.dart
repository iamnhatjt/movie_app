import 'package:flutter/material.dart';
import 'package:movie_app/core/presentation/simple_shadow.dart';

class RoundedButton extends StatelessWidget {
  final double? radius;
  final double? height;
  final double? width;
  final Color? color;
  final VoidCallback? ontap;
  final EdgeInsets? padding;

  final Widget child;
  const RoundedButton(
      {super.key,
      this.radius,
      required this.child,
      this.height,
      this.width,
      this.color,
      this.ontap,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: padding,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color ?? Colors.white38,
          borderRadius: BorderRadius.circular(radius ?? 12),
          boxShadow: simpleShadow,
        ),
        child: child,
      ),
    );
  }
}
