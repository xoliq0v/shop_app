import '../../../design_system.dart';
import 'package:flutter/material.dart';

class AppImage extends Image {
  AppImage.asset(
    super.name, {
    super.key,
    super.width,
    super.height,
    super.color,
    super.fit,
    super.alignment = Alignment.center,
    super.package = AppConstants.packageName,
  }) : super.asset();
}
