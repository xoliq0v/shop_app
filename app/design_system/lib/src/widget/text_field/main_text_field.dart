import '../../../design_system.dart';
import 'custom_input.dart';
import 'package:flutter/material.dart';

class MainTextField extends AppFormField {
  MainTextField({
    required super.controller,
    super.height,
    super.key,
    super.onChanged,
    super.autofocus,
    super.keyboardType,
    super.initialValue,
    super.inputFormatters,
    super.cursorColor,
    super.validator,
    String? label,
    super.fillColor,
    bool onTapOutsideUnFocus = false,
    super.suffixIcon,
    super.suffixIconConstraints,
  }) : super(
          onTapOutside: onTapOutsideUnFocus
              ? (event) => FocusManager.instance.primaryFocus?.unfocus()
              : null,
          style: AppTextConstants.style15W400,
          hintText: label,
          hintStyle: AppTextConstants.style15W400.copyWith(
            color: AppColors.black60,
          ),
        );

  MainTextField.withClear({
    required super.controller,
    super.height,
    super.key,
    super.onChanged,
    super.autofocus,
    super.keyboardType,
    super.initialValue,
    super.inputFormatters,
    super.cursorColor,
    super.validator,
    String? label,
    super.fillColor,
    bool onTapOutsideUnFocus = false,
  }) : super.withClear(
          onTapOutside: onTapOutsideUnFocus
              ? (event) => FocusManager.instance.primaryFocus?.unfocus()
              : null,
          style: AppTextConstants.style15W400,
          hintText: label,
          hintStyle: AppTextConstants.style15W400.copyWith(
            color: AppColors.black60,
          ),
        );
}

class DefaultTextField extends TextFormField {
  DefaultTextField({
    super.key,
    super.controller,
    Widget? prefixIcon,
    super.autofocus,
    super.enabled,
    super.style,
    super.keyboardType,
    super.validator,
    super.cursorErrorColor = AppColors.red,
    super.autovalidateMode,
    super.focusNode,
    super.textInputAction,
    String? hintText,
    TextStyle? hintStyle,
    Color? fillColor,
    bool isDense = true,
    bool onTapOutsideUnFocus = false,
    super.inputFormatters,
  }) : super(
          textAlignVertical: TextAlignVertical.center,
          maxLines: 1,
          onTapOutside: onTapOutsideUnFocus
              ? (event) => FocusManager.instance.primaryFocus?.unfocus()
              : null,
          strutStyle: StrutStyle(
            fontSize: style?.fontSize,
            fontWeight: style?.fontWeight,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle,
            isDense: isDense,
            filled: true,
            fillColor: fillColor ?? AppColors.gray,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            prefixIconConstraints: const BoxConstraints(),
            constraints: const BoxConstraints(),
            prefixIcon: prefixIcon,
          ),
        );
}
