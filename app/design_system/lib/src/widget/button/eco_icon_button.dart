import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EcoIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? svgPath;
  final IconData? icon;
  final double size;
  final Color? color;
  final String? semanticLabel;

  const EcoIconButton({
    super.key,
    required this.onPressed,
    this.svgPath,
    this.icon,
    this.size = 24.0,
    this.color,
    this.semanticLabel,
  }) : assert(svgPath != null || icon != null, 'Either svgPath or icon must be provided');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveColor = color ?? theme.iconTheme.color;

    Widget iconWidget;
    if (svgPath != null) {
      iconWidget = SvgPicture.asset(
        svgPath!,
        width: size,
        height: size,
        colorFilter: effectiveColor != null
            ? ColorFilter.mode(effectiveColor, BlendMode.srcIn)
            : null,
        semanticsLabel: semanticLabel,
      );
    } else {
      iconWidget = Icon(
        icon,
        size: size,
        color: effectiveColor,
        semanticLabel: semanticLabel,
      );
    }

    return IconButton(
      icon: iconWidget,
      onPressed: onPressed,
      iconSize: size,
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(
        minWidth: size,
        minHeight: size,
      ),
      splashRadius: size * 0.8,
    );
  }
}