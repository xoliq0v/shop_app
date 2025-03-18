import '../../../design_system.dart';
import 'package:flutter/material.dart';

class AppIconSvg extends SvgPicture {
  /// This is for .svg.vec vector file
  AppIconSvg.assetVec(
    String assetName, {
    super.key,
    super.width,
    super.height,
    Color? color,
    super.fit,
    super.alignment = Alignment.center,
  }) : super(
          AssetBytesLoader(assetName, packageName: AppConstants.packageName),
          colorFilter:
              color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
        );

  /// This is for .svg file
  AppIconSvg.asset(
    super.assetName, {
    super.key,
    super.width,
    super.height,
    super.color,
    super.colorBlendMode,
    super.fit,
    super.alignment = Alignment.center,
    super.package = AppConstants.packageName,
  }) : super.asset();
}
