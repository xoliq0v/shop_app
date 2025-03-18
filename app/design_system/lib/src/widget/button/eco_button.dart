import '../../../design_system.dart';
import 'package:flutter/material.dart';

class EcoButton extends StatelessWidget {
  final VoidCallback? onPressed;  // Change to nullable
  final Widget child;
  final double? width;
  final double? height;
  final double borderRadius;
  final List<Color> gradientColors;
  final Color? backgroundColor;
  final BoxBorder? border;
  final EdgeInsetsGeometry padding;

  const EcoButton({
    super.key,
    this.onPressed,  // Allow null for onPressed
    required this.child,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderRadius = 10,
    this.border,
    this.gradientColors = const [AppColors.main, AppColors.glen],
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  });

  factory EcoButton.min({
    required VoidCallback onPressed,
    required Widget child,
    Color? backgroundColor,
    double borderRadius = 8,
    BoxBorder? border,
    List<Color> gradientColors = const [AppColors.main, AppColors.glen],
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  }) {
    return EcoButton(
      onPressed: onPressed,
      child: child,
      width: 200, // Reduced width for mini button
      height: 40, // Reduced height for mini button
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      border: border,
      gradientColors: gradientColors,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isTablet = constraints.maxWidth >= 600;
        final double maxWidth = width ?? constraints.maxWidth * (isTablet ? 0.6 : 0.8);
        final double buttonHeight = height ?? constraints.maxHeight * 0.06;
        return SizedBox(
          width: maxWidth,
          height: buttonHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              gradient: backgroundColor == null
                  ? LinearGradient(
                colors: gradientColors,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
                  : null,
              border: border,
              color: backgroundColor,
            ),
            child: ElevatedButton(
              onPressed: onPressed == null ? null : onPressed,  // Disable if null
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                foregroundColor: Colors.white,
                backgroundColor: onPressed == null ? Colors.grey : null,  // Change button color when disabled
              ),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
