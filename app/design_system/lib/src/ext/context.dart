import 'dart:io';
import 'dart:ui' show ImageFilter;

import 'package:core/core.dart';
import '../../design_system.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension BottomSheetExt on BuildContext {

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Future<void> popBottomSheet() async {
    await router.maybePop();
    return Future.delayed(const Duration(milliseconds: 350));
  }

  Future<T?> showCustomBarModalBottomSheet<T>({
    required Widget Function(BuildContext context) builder,
    bool useRootNavigator = true,
  }) {
    return showBarModalBottomSheet(
      context: this,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.4),
      useRootNavigator: useRootNavigator,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.transparent,
          width: 0,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(26)).r,
      ),
      topControl: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: SizedBox(
          height: 4.h,
          width: 60.w,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ),
      builder: (context) => ColoredBox(
        color: Colors.white,
        child: builder.call(context),
      ),
    );
  }

  Future<T?> showCustomAdaptiveBottomSheet<T>({
    required Widget Function(BuildContext context) builder,
    bool safeArea = true,
    bool expand = false,
    bool enableDrag = true,
    bool bounce = true,
    double closeProgressThreshold = 0.7,
  }) {
    if (Platform.isIOS) {
      return CupertinoScaffold.showCupertinoModalBottomSheet<T>(
        context: this,
        backgroundColor: AppColors.gray,
        useRootNavigator: true,
        expand: expand,
        enableDrag: enableDrag,
        bounce: bounce,
        closeProgressThreshold: closeProgressThreshold,
        builder: (context) {
          return SafeArea(
            top: false,
            bottom: safeArea,
            child: builder.call(context),
          );
        },
      );
    }
    return showMaterialModalBottomSheet<T>(
      context: this,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: const Radius.circular(12).r),
      ),
      useRootNavigator: true,
      expand: expand,
      enableDrag: enableDrag,
      bounce: bounce,
      closeProgressThreshold: closeProgressThreshold,
      builder: (context) {
        return SafeArea(
          bottom: safeArea,
          child: Stack(
            children: [
              builder.call(context),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(16).r,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.4),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ).onPressWithoutEffect(() {
                    Navigator.pop(context);
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<T?> showDefaultBottomSheet<T>({
    required Widget Function(BuildContext context) builder,
    bool safeArea = true,
    bool enableDrag = true,
    bool isScrollControlled = false,
    Color backgroundColor = Colors.white,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: const Radius.circular(12).r,
        ),
      ),
      useRootNavigator: true,
      isScrollControlled: isScrollControlled,
      enableDrag: enableDrag,
      builder: (context) {
        if (safeArea) {
          return Padding(
            padding: EdgeInsets.only(bottom: AppScreen.bottomBarHeight),
            child: builder.call(context),
          );
        }
        return builder.call(context);
      },
    );
  }
}

extension SnackBarExt on BuildContext {
  Future<T?> showSuccessSnackBar<T>(String message) {
    return showToast<T>(
      Row(children: [
        AppIconSvg.asset(
          AppIcons.globe01,
          height: 24.r,
          width: 24.r,
        ),
        12.horizontalSpace,
        Flexible(
          child: Text(
            message,
            style: AppTextConstants.style13W500,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ]),
      backgroundColor: AppColors.green,
      alignment: Alignment.bottomCenter,
      padding: REdgeInsets.all(12),
      margin: EdgeInsets.only(
        left: 16.r,
        right: 16.r,
        bottom: AppScreen.bottomBarHeight + 16.r,
      ),
      duration: const Duration(seconds: 5),
      shape: RoundedRectangleBorder(borderRadius: AppDesignConstants.radius16),
    );
  }

  Future<T?> showErrorSnackBar<T>(String message) {
    return showToast<T>(
      Row(children: [
        AppIconSvg.asset(
          AppIcons.globe01,
          height: 24.r,
          width: 24.r,
        ),
        12.horizontalSpace,
        Flexible(
          child: Text(
            message,
            style: AppTextConstants.style13W500,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ]),
      backgroundColor: AppColors.green,
      alignment: Alignment.bottomCenter,
      padding: REdgeInsets.all(12),
      margin: EdgeInsets.only(
        left: 16.r,
        right: 16.r,
        bottom: AppScreen.bottomBarHeight + 16.r,
      ),
      duration: const Duration(seconds: 5),
      shape: RoundedRectangleBorder(borderRadius: AppDesignConstants.radius16),
    );
  }

  Future<T?> showFullScreenPage<T>({
    required Widget Function(FlashController<T> controller) builder,
  }) {
    return showFlash<T>(
      context: this,
      builder: (BuildContext context, FlashController<T> controller) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(controller.controller),
          child: builder.call(controller),
        );
      },
    );
  }
}