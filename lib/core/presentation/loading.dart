import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  final Color color;
  const LoadingWidget({super.key, this.size = 50, this.color = Colors.amber});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeArchedCircle(color: color, size: size),
    );
  }
}
