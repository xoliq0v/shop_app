import '../../../design_system.dart';
import 'package:flutter/cupertino.dart';

class AppNetworkImage extends CachedNetworkImage {
  AppNetworkImage({
    required super.imageUrl,
    super.fit,
    super.color,
    EdgeInsetsGeometry paddingImage = EdgeInsets.zero,
    double? dimension,
    super.key,
  }) : super(
          placeholder: (
            BuildContext context,
            String url,
          ) {
            return Padding(
              padding: paddingImage,
              child: AppImage.asset(
                AppIcons.home01,
                width: dimension,
                height: dimension,
              ),
            );
          },
          errorWidget: (
            BuildContext context,
            String url,
            Object error,
          ) {
            return Padding(
              padding: paddingImage,
              child: AppImage.asset(
                AppIcons.home01,
                width: dimension,
                height: dimension,
              ),
            );
          },
        );
}
