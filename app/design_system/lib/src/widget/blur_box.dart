import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class CustomBlurBox extends StatelessWidget {
  const CustomBlurBox({
    required this.child,
    required this.borderRadius,
    required this.blur,
    required this.color,
    super.key,
  });

  final Widget child;
  final BorderRadiusGeometry borderRadius;
  final double blur;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: blur,
          sigmaY: blur,
        ),
        child: ColoredBox(
          color: color,
          child: child,
        ),
      ),
    );
  }
}
