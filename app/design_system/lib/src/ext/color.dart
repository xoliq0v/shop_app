import '../../design_system.dart';
import 'package:flutter/material.dart';

extension EcoColorScheme on ColorScheme {
  Color get cardColor => brightness == Brightness.light
      ? AppColors.mintZest // Light theme card color
      : AppColors.dynamicBlack; // Dark theme card color

}