import '../../../design_system.dart';
import 'package:flutter/material.dart';

class EcoMaterialButton extends MaterialButton {
  EcoMaterialButton({
    required super.onPressed,
    required super.child,
    super.color = AppColors.green,
    super.disabledColor = AppColors.gray,
    super.minWidth = 500,
    double radius = 40,
    super.key,
    super.elevation = 0,
    EdgeInsetsGeometry? padding,
  }) : super(
          height: 0,
          padding: padding ??
              EdgeInsets.symmetric(
                vertical: 25.h,
                horizontal: 8.w,
              ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius).r,
          ),
        );

}

class EcoOutlineButton extends OutlinedButton {
  EcoOutlineButton({
    required super.onPressed,
    required super.child,
    super.key,
    // Size? minimumSize,
  }) : super(
          style: OutlinedButton.styleFrom(
            backgroundColor: AppColors.black90,
            // minimumSize: minimumSize ?? Size(48.r, 42.r),
            padding: REdgeInsets.symmetric(
              vertical: 9,
              horizontal: 12,
            ),
            elevation: 0,
            side: const BorderSide(
              width: 0,
              color: Colors.transparent,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: AppDesignConstants.radius12,
            ),
          ),
        );
}

class EcoElevatedButton extends ElevatedButton {
  EcoElevatedButton({
    required super.onPressed,
    required super.child,
    Color backgroundColor = AppColors.green,
    Color disabledColor = AppColors.gray,
    double radius = 16,
    double maxHeight = 50,
    double maxWidth = 500,
    super.key,
    double elevation = 0,
    EdgeInsetsGeometry? padding,
  }) : super(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            disabledBackgroundColor: disabledColor,
            maximumSize: Size(maxWidth, maxHeight),
            padding: padding ??
                EdgeInsets.symmetric(
                  vertical: 16.h,
                  horizontal: 8.w,
                ),
            elevation: elevation,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        );

  EcoElevatedButton.loading({
    required super.onPressed,
    required Widget child,
    required bool loading,
    Color backgroundColor = AppColors.green,
    Color disabledColor = AppColors.gray,
    Animation<Color> loadingColor = const AlwaysStoppedAnimation<Color>(
      Colors.black,
    ),
    double radius = 35,
    super.key,
    double elevation = 0,
    double minHeight = double.minPositive,
    double maxHeight = 50,
    EdgeInsetsGeometry? padding,
    Color? loadingBackgroundColor,
    Color foregroundColor = Colors.black,
  }) : super(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            disabledBackgroundColor: disabledColor,
            padding: padding ??
                EdgeInsets.symmetric(
                  vertical: 16.h,
                  horizontal: 8.w,
                ),
            minimumSize: Size.fromHeight(minHeight),
            maximumSize: Size.fromHeight(maxHeight),
            elevation: elevation,
            textStyle: AppTextConstants.styleButton,
            foregroundColor: foregroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            shadowColor: Colors.transparent,
          ),
          child: FittedBox(
            fit: BoxFit.none,
            child: loading
                ? CircularProgressIndicator.adaptive(
                    backgroundColor: loadingBackgroundColor,
                    valueColor: loadingColor,
                  )
                : child,
          ),
        );
}
