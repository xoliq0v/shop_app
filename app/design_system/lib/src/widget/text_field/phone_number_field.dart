import '../../../design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EcoUzbekPhoneTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? topRightText;
  final Function(String)? onChanged;
  final bool validateOnChange;
  final double? width;
  final double? height;
  final double? radius;
  final Color? backgroundColor;
  final Color iconColor;

  const EcoUzbekPhoneTextField({
    super.key,
    this.controller,
    this.topRightText = 'Phone Number',
    this.onChanged,
    this.validateOnChange = true,
    this.width,
    this.height,
    this.radius = 15,
    this.backgroundColor,
    this.iconColor = Colors.black,
  });

  @override
  State<EcoUzbekPhoneTextField> createState() => _EcoUzbekPhoneTextFieldState();
}

class _EcoUzbekPhoneTextFieldState extends State<EcoUzbekPhoneTextField> {
  late TextEditingController _controller;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController(text: '+998 ');

    // Ensure initial formatting
    _formatPhoneNumber();
    _controller.addListener(_formatPhoneNumber);
  }
  @override
  void dispose() {
    // Only dispose if we created the controller
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _formatPhoneNumber() {
    String text = _controller.text;

    // Ensure +998 prefix, but be more careful
    if (!text.startsWith('+998 ')) {
      // If text doesn't have prefix, add it
      text = '+998 ' + text.replaceAll(RegExp(r'\D'), '');
    }

    // Remove non-digit characters except +
    String digitsOnly = text.replaceAll(RegExp(r'[^\d]'), '');

    // Trim to maximum length
    if (digitsOnly.length > 12) {
      digitsOnly = digitsOnly.substring(0, 12);
    }

    // Minimal formatting for early stages of input
    if (digitsOnly.length <= 3) {
      // Just keep the prefix and digits
      String formatted = '+998 ' + digitsOnly.substring(3);

      if (_controller.text != formatted) {
        _controller.value = TextEditingValue(
            text: formatted,
            selection: TextSelection.fromPosition(
                TextPosition(offset: formatted.length)
            )
        );
      }
      return;
    }

    // More robust formatting for later stages
    String formatted = '+998 ';
    if (digitsOnly.length > 3) {
      formatted += digitsOnly.substring(3, 5) + ' '; // Operator code
      if (digitsOnly.length > 5) {
        formatted += digitsOnly.substring(5, 8) + ' '; // First part
        if (digitsOnly.length > 8) {
          formatted += digitsOnly.substring(8, 10) + ' '; // Second part
          if (digitsOnly.length > 10) {
            formatted += digitsOnly.substring(10); // Last part
          }
        }
      }
    }

    // Update controller if different
    if (_controller.text != formatted) {
      _controller.value = TextEditingValue(
          text: formatted,
          selection: TextSelection.fromPosition(
              TextPosition(offset: formatted.length)
          )
      );
    }
  }

  // Uzbekistan phone number validator
// Consider adding more robust validation
  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    // Remove formatting characters
    final cleanedNumber = value.replaceAll(RegExp(r'[^\d]'), '');

    // Ensure total length is correct (including country code)
    if (cleanedNumber.length != 12) {
      return 'Phone number must be 12 digits long';
    }

    // More strict validation for Uzbekistan numbers
    if (!cleanedNumber.startsWith('998')) {
      return 'Must start with Uzbekistan country code';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return EcoTextField(
      controller: _controller,
      hintText: '+998 90 XXX XX XX',
      topRightText: widget.topRightText,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[+\d]')),
      ],
      validator: _validatePhoneNumber,
      validateOnChange: widget.validateOnChange,
      width: widget.width,
      height: widget.height,
      radius: widget.radius,
      backgroundColor: widget.backgroundColor,
      iconColor: widget.iconColor,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value ?? '');
        }
      },
    );
  }
}