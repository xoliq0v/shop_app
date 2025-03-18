import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerView extends StatelessWidget {
  const ShimmerView({
    required this.child,
    super.key,
    this.enable = true,
    this.loop = 5,
  });

  final Widget child;
  final bool enable;
  final int loop;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200,
      highlightColor: isDarkMode ? Colors.grey.shade600 : Colors.white,
      loop: loop,
      period: const Duration(seconds: 2),
      enabled: enable,
      child: child,
    );
  }
}

class ShimmerViewBox extends StatelessWidget {
  const ShimmerViewBox({
    this.color,
    this.width,
    this.height,
    this.radius = 16,
    super.key,
  });

  final Color? color;
  final double? width;
  final double? height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color ?? (isDarkMode ? Colors.grey.shade700 : Colors.white),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: SizedBox(width: width, height: height),
    );
  }
}
