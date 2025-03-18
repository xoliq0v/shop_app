import 'dart:io';

import '../../design_system.dart';
import 'package:flutter/material.dart';

extension IndicatorPositionExt on IndicatorPosition {
  Header adaptiveX({
    double? triggerOffset,
    double maxOverOffset = double.infinity,
    Color? backgroundColor,
    Color foregroundColor = Colors.black,
  }) {
    return Platform.isIOS
        ? CupertinoHeader(
            triggerOffset: triggerOffset ?? 60,
            maxOverOffset: maxOverOffset,
            backgroundColor: backgroundColor ?? Colors.transparent,
            foregroundColor: foregroundColor,
            position: this,
          )
        : MaterialHeader(
            backgroundColor: backgroundColor ?? Colors.white,
            color: foregroundColor,
            position: this,
          );
  }
}
