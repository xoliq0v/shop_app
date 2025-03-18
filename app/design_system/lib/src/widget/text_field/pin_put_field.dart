import '../../../design_system.dart';
import 'package:flutter/material.dart';

class MyPinPutField extends Pinput {
  MyPinPutField({
    super.key,
    super.autofocus = false,
    super.showCursor = false,
    super.closeKeyboardWhenCompleted = false,
    super.onCompleted,
    super.onTapOutside,
    super.onChanged,
    super.focusNode,
    super.controller,
    super.validator,
    super.forceErrorState,
    super.errorText,
    super.hapticFeedbackType = HapticFeedbackType.lightImpact,
    super.length = 6,
  }) : super(
          defaultPinTheme: defaultPinThemeX(),
          errorPinTheme: errorPinThemeX(),
          errorBuilder: (String? errorText, String pin) {
            return const SizedBox.shrink();
          },
        );

  static PinTheme errorPinThemeX() {
    return PinTheme(
      width: 50.r,
      height: 50.r,
      textStyle: AppTextConstants.style22W500.copyWith(
        color: AppColors.black20,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.red),
        borderRadius: AppDesignConstants.radius16,
        color: AppColors.gray,
      ),
    );
  }

  static PinTheme defaultPinThemeX() {
    return PinTheme(
      width: 50.r,
      height: 50.r,
      textStyle: AppTextConstants.style22W500.copyWith(
        color: AppColors.black20,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.black90),
        borderRadius: AppDesignConstants.radius16,
        color: AppColors.gray,
      ),
    );
  }
}
