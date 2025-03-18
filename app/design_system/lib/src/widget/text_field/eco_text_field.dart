import '../../../design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../button/eco_icon_button.dart';

class EcoTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? padding;
  final InputDecoration? decoration;
  final double? width;
  final double? height;
  final bool autocorrect;
  final double? radius;
  final Color? backgroundColor;
  final Color iconColor;
  final bool validateOnChange;
  final String? topRightText;
  final String? svgSuffixIcon;
  final Function()? svgSuffixIconPressed;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String? value)? onChanged;
  final bool readOnly;
  final String? initialValue;

  const EcoTextField({
    super.key,
    this.hintText = '',
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.padding,
    this.decoration,
    this.width,
    this.height,
    this.radius = 15,
    this.autocorrect = true,
    this.backgroundColor,
    this.iconColor = Colors.black,
    this.validateOnChange = false,
    this.topRightText,
    this.svgSuffixIcon,
    this.svgSuffixIconPressed,
    this.inputFormatters,
    this.onChanged,
    this.readOnly = false,
    this.initialValue
  });

  @override
  State<EcoTextField> createState() => _EcoTextFieldState();
}
class _EcoTextFieldState extends State<EcoTextField> {
  late bool _isObscured;
  String? _errorText;
  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
    if (widget.controller == null && widget.initialValue != null) {
      _controller = TextEditingController(text: widget.initialValue);
    }
  }

  void _runValidator(String? value) {
    if (widget.validator != null) {
      setState(() {
        _errorText = widget.validator!(value);
      });
    }
  }

  @override
  void dispose() {
    // Dispose the controller if we created it
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;
        final double maxWidth = MediaQuery.sizeOf(context).width * (isTablet ? 0.6 : 0.9);

        final double fontSize = isTablet ? 16 : 14;
        final double iconSize = isTablet ? 24 : 20;
        final double fieldHeight = widget.height ?? (isTablet ? 60 : 48);
        final double fieldWidth = widget.width ?? maxWidth;

        return Padding(
          padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.topRightText != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                    child: Text(widget.topRightText!,style: Theme.of(context).textTheme.headlineSmall,),
                ),

              SizedBox(
                width: fieldWidth,
                height: fieldHeight + 20,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.radius!),
                    color: widget.backgroundColor,
                  ),
                  child: TextFormField(
                    autocorrect: widget.autocorrect,
                    controller: widget.controller ?? _controller,
                    readOnly: widget.readOnly,
                    keyboardType: widget.keyboardType,
                    obscureText: _isObscured,
                    textInputAction: widget.textInputAction,
                    validator: widget.validator,
                    style: TextStyle(fontSize: fontSize),
                    inputFormatters: widget.inputFormatters,
                    onChanged: (value) {
                      if(widget.onChanged!=null){
                        widget.onChanged!(value);
                      }
                      if (widget.validateOnChange) {
                        _runValidator(value);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      hintStyle: TextStyle(color: colorScheme.onSurface.withOpacity(0.5), fontSize: fontSize),
                      prefixIcon: widget.prefixIcon ?? null,
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if(widget.svgSuffixIcon != null)...[
                            InkWell(
                              onTap: widget.svgSuffixIconPressed,
                                child: SvgPicture.asset(widget.svgSuffixIcon!)),
                            15.horizontalSpace
                          ],

                          if (_errorText != null)
                            Icon(Icons.error_outline, color: colorScheme.error, size: iconSize),
                            15.horizontalSpace,
                          if (widget.obscureText)
                            EcoIconButton(
                              icon: _isObscured ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                              onPressed: () {
                                setState(() {
                                  _isObscured = !_isObscured;
                                });
                              },
                              color: widget.iconColor,
                            ),
                          if (widget.suffixIcon != null && !widget.obscureText)
                            Icon(widget.suffixIcon, size: iconSize, color: widget.iconColor),
                        ],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(widget.radius ?? maxWidth * 0.025),
                        borderSide: BorderSide(color: _errorText != null ? colorScheme.error : colorScheme.secondary, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(widget.radius ?? maxWidth * 0.025),
                        borderSide: BorderSide(color: _errorText != null ? colorScheme.error : colorScheme.secondary, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(widget.radius ?? maxWidth * 0.025),
                        borderSide: BorderSide(color: _errorText != null ? colorScheme.error : colorScheme.surface, width: 2.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(widget.radius ?? maxWidth * 0.025),
                        borderSide: BorderSide(color: colorScheme.error, width: 1.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(widget.radius ?? maxWidth * 0.025),
                        borderSide: BorderSide(color: colorScheme.error, width: 2.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: maxWidth * 0.04,
                          vertical: (widget.height ?? maxWidth * 0.12) / 4
                      ),
                      fillColor: widget.backgroundColor,
                      filled: true,
                    ),
                  ),
                ),
              ),
              if (_errorText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 12),
                  child: Text(
                    _errorText!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: colorScheme.error, fontSize: fontSize * 0.8),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
