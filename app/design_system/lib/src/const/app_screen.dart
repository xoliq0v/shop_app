import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin AppScreen {
  static double get width => ScreenUtil().screenWidth;

  static double get height => ScreenUtil().scaleHeight;

  static double get bottomBarHeight => ScreenUtil().bottomBarHeight;

  static double get bottomSheetBottomInset => ScreenUtil().bottomBarHeight + 10;

  static double get bottomPadding {
    return kBottomNavigationBarHeight +
        AppScreen.bottomBarHeight +
        ScreenUtil().setHeight(24);
  }

  static double get bottomPaddingWithoutNavBar {
    return AppScreen.bottomBarHeight + ScreenUtil().setHeight(26);
  }

  static double get bottomNavBarHeight {
    return kBottomNavigationBarHeight + AppScreen.bottomBarHeight;
  }

  static double get statusBarHeight {
    return ScreenUtil().statusBarHeight;
  } // Status bar height , Notch will be higher

  static Orientation get orientation => ScreenUtil().orientation;

  static double? get pixelRatio => ScreenUtil().pixelRatio;

  static double get textScaleFactor => ScreenUtil().textScaleFactor;
}
