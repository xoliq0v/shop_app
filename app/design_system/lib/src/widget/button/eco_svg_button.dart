import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EcoSvgButton extends StatelessWidget {
  final String icon;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Function() onPressed;
  final Color? color;
  const EcoSvgButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.width,
    this.height,
    this.backgroundColor,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 70,
      height: height ?? 70,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(50)
        ),
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: SvgPicture.asset(
                icon,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
