import 'package:core/core.dart';
import '../../design_system.dart';
import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  static const packageName = 'design_system';
  static const fontFamily = 'Rubik';

  // static MaskTextInputFormatter phoneMaskFormatter = MaskTextInputFormatter(
  //   mask: '## ### ## ##',
  //   filter: {'#': RegExp('[0-9]')},
  // );
  //
  // static MaskTextInputFormatter phoneFullMaskFormatter = MaskTextInputFormatter(
  //   mask: '+998 ## ### ## ##',
  //   filter: {'#': RegExp('[0-9]')},
  // );
}

class AppDesignConstants {
  AppDesignConstants._();

  static BoxShadow defaultBoxShadow = BoxShadow(
    blurRadius: 12,
    color: Colors.black.withOpacity(0.1),
  );

  static BorderRadius radius6 = BorderRadius.circular(6).r;
  static BorderRadius radius8 = BorderRadius.circular(8).r;
  static BorderRadius radius10 = BorderRadius.circular(10).r;
  static BorderRadius radius12 = BorderRadius.circular(12).r;
  static BorderRadius radius16 = BorderRadius.circular(16).r;
  static BorderRadius radius26 = BorderRadius.circular(26).r;
}

class AppTextConstants {
  AppTextConstants._();

  static const TextStyle styleButton = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle style11W400 = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle style11W500 = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle style12W400 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle style12W500 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle style13W400 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle style13W500 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle style14W400 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle style14W500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle style15W400 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle style15W500 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle style15W700 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle style16W400 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle style16W500 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle style16W700 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle style18W700 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle style18W800 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle style20W500 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle style22W400 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle style22W500 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle style24W500 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
}
