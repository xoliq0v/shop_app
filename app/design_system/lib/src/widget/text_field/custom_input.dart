import '../../../design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppFormField extends FormField<String?> {
  AppFormField({
    required TextEditingController controller,
    ValueChanged<String>? onChanged,
    bool autofocus = false,
    bool filled = true,
    TextInputType? keyboardType,
    super.initialValue,
    List<TextInputFormatter>? inputFormatters,
    Color? cursorColor,
    Widget? label,
    super.validator,
    void Function(PointerDownEvent)? onTapOutside,
    TextStyle? style,
    String? hintText,
    TextStyle? hintStyle,
    EdgeInsetsGeometry? contentPadding,
    Color? fillColor,
    Widget? suffixIcon,
    BoxConstraints? suffixIconConstraints,
    double? height,
    bool expands = false,
    int? maxLines = 1,
    super.key,
  }) : super(
          builder: (FormFieldState<String?> formState) {
            return UnmanagedRestorationScope(
              bucket: formState.bucket,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: controller,
                    autofocus: autofocus,
                    onChanged: onChanged,
                    keyboardType: keyboardType,
                    cursorColor: cursorColor ?? Colors.black,
                    style: style,
                    onTapOutside: onTapOutside,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: hintStyle,
                      filled: filled,
                      label: label,
                      fillColor: fillColor ?? AppColors.gray,
                      contentPadding: contentPadding ??
                          const EdgeInsets.symmetric(
                            horizontal: 16,
                          ).r,
                      border: borderDecoration(),
                      enabledBorder: borderDecoration(),
                      focusedBorder: borderDecoration(),
                      errorBorder: borderDecoration(),
                      suffixIcon: suffixIcon,
                      suffixIconConstraints: suffixIconConstraints,
                      constraints: BoxConstraints(
                        maxHeight: height ?? 48.h,
                        minHeight: height ?? 0,
                      ),
                    ),
                    inputFormatters: inputFormatters,
                    expands: expands,
                    maxLines: maxLines,
                  ),
                ],
              ),
            );
          },
        );

  AppFormField.withClear({
    required TextEditingController controller,
    ValueChanged<String>? onChanged,
    bool autofocus = false,
    bool filled = true,
    TextInputType? keyboardType,
    super.initialValue,
    List<TextInputFormatter>? inputFormatters,
    Color? cursorColor,
    Widget? label,
    super.validator,
    void Function(PointerDownEvent)? onTapOutside,
    TextStyle? style,
    String? hintText,
    TextStyle? hintStyle,
    EdgeInsetsGeometry? contentPadding,
    Color? fillColor,
    double? height,
    bool expands = false,
    int? maxLines = 1,
    super.key,
  }) : super(
    builder: (FormFieldState<String?> formState) {
      return UnmanagedRestorationScope(
        bucket: formState.bucket,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: controller,
              autofocus: autofocus,
              onChanged: onChanged,
              keyboardType: keyboardType,
              cursorColor: cursorColor ?? Colors.black,
              style: style,
              onTapOutside: onTapOutside,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: hintStyle,
                filled: filled,
                label: label,
                fillColor: fillColor ?? AppColors.gray,
                contentPadding: contentPadding ??
                    const EdgeInsets.symmetric(
                      horizontal: 16,
                    ).r,
                border: borderDecoration(),
                enabledBorder: borderDecoration(),
                focusedBorder: borderDecoration(),
                errorBorder: borderDecoration(),
                suffixIcon: ValueListenableBuilder(
                  valueListenable: controller,
                  builder: (
                      BuildContext context,
                      TextEditingValue value,
                      Widget? child,
                      ) {
                    return Visibility(
                      visible: value.text.isNotEmpty,
                      child: child!,
                    );
                  },
                  child: Padding(
                    padding: REdgeInsets.only(right: 16),
                    child: AppIconSvg.asset(
                      AppIcons.globe01,
                      color: AppColors.black70,
                    ).onTap(onTap: () {
                      controller.clear();
                      onChanged?.call('');
                    }),
                  ),
                ),
                suffixIconConstraints: BoxConstraints(maxHeight: 24.r),
                constraints: BoxConstraints(
                  maxHeight: height ?? 48.h,
                  minHeight: height ?? 0,
                ),
              ),
              inputFormatters: inputFormatters,
              expands: expands,
              maxLines: maxLines,
            ),
          ],
        ),
      );
    },
  );


  static OutlineInputBorder borderDecoration() {
    return OutlineInputBorder(
      borderRadius: AppDesignConstants.radius16,
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
      gapPadding: 12,
    );
  }
}
