import '../../design_system.dart';
import 'package:flutter/material.dart';

class MyDivider extends Divider {
  MyDivider({
    double? indent,
    super.height = 1,
    super.thickness = 1,
    super.key,
  }) : super(
          indent: indent ?? 40.r,
          color: AppColors.black90,
        );
}
