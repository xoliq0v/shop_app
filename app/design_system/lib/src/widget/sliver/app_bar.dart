import '../../../design_system.dart';
import 'package:flutter/material.dart';

class MySliverAppBar extends SliverAppBar {
  MySliverAppBar({
    String? title,
    super.backgroundColor,
    super.forceElevated,
    super.pinned = true,
    super.elevation = 1,
    super.scrolledUnderElevation = 1,
    super.snap = true,
    super.floating = true,
    super.bottom,
    super.expandedHeight,
    super.toolbarHeight,
    super.collapsedHeight,
    super.flexibleSpace,
    super.shadowColor = AppColors.gray,
    super.centerTitle = true,
    super.key,
  }) : super(
          title: title == null
              ? null
              : Text(
                  title,
                  style: AppTextConstants.style15W500,
                ),
        );
}
