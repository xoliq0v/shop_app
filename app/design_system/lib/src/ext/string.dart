import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:core/core.dart';
import '../../design_system.dart';
import 'package:flutter/services.dart' as services;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

extension StringExtDesign on String {
  Future<Uint8List> svgToUint8List({
    double targetWidth = 48,
    double targetHeight = 48,
    String? package,
  }) async {


    final path = package == null ? this : 'packages/$package/$this';
    final svgString = await services.rootBundle.loadString(path);
    final pictureInfo = await vg.loadPicture(
      SvgStringLoader(svgString),
      null,
      onError: (error, stackTrace) {
        debugPrint('Error $error');
      },
    );

    final devicePixelRatio =
        ui.PlatformDispatcher.instance.views.first.devicePixelRatio;
    final width = (targetWidth * devicePixelRatio).toInt();
    final height = (targetHeight * devicePixelRatio).toInt();

    final scaleFactor = min(
      width / pictureInfo.size.width,
      height / pictureInfo.size.height,
    );

    final recorder = ui.PictureRecorder();

    ui.Canvas(recorder)
      ..scale(scaleFactor)
      ..drawPicture(pictureInfo.picture);

    final rasterPicture = recorder.endRecording();

    final image = rasterPicture.toImageSync(width, height);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

}

extension UzbekPhoneNumberFormatter on String {
  String formatUzbekPhoneNumberMap() {
    // Remove any non-digit characters (like spaces, dashes, etc.)
    String digits = this.replaceAll(RegExp(r'\D'), '');

    // Check if it's a valid length for an Uzbek phone number
    if (digits.length == 12 && digits.startsWith('998')) {
      return '(${digits.substring(3, 5)}) ${digits.substring(5, 8)}-${digits.substring(8)}';
    } else {
      return 'Invalid number';
    }
  }
  String formatUzbekPhoneNumber() {
    // Remove any non-digit characters (like spaces, dashes, etc.)
    String digits = this.replaceAll(RegExp(r'\D'), '');

    // Check if it's a valid length for an Uzbek phone number
    if (digits.length == 12 && digits.startsWith('998')) {
      return '+998 (${digits.substring(3, 5)}) ${digits.substring(5, 8)}-${digits.substring(8)}';
    } else {
      return 'Invalid number';
    }
  }

  String formatTime() {
    final parts = this.split(':');
    final hours = parts[0].padLeft(2, '0');
    final minutes = parts[1].padLeft(2, '0');
    return '$hours:$minutes';
  }
}

class UzbekPhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Remove all non-digit characters
    String numbers = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    // Remove the country code if user tries to input it
    if (numbers.startsWith('998')) {
      numbers = numbers.substring(3);
    }

    // Limit to 9 digits (excluding country code)
    if (numbers.length > 9) {
      numbers = numbers.substring(0, 9);
    }

    String formatted = '';

    // Always add the country code
    formatted += '+998 ';

    // Add the remaining numbers with proper spacing
    for (var i = 0; i < numbers.length; i++) {
      if (i == 2) formatted += '${numbers[i]} ';
      else if (i == 5) formatted += '${numbers[i]} ';
      else if (i == 7) formatted += '${numbers[i]} ';
      else formatted += numbers[i];
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}