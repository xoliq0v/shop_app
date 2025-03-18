import '../../design_system.dart';
import 'package:flutter/material.dart';

extension InkWellExt on Widget {
  Material onPress(
    void Function()? onTap, {
    double radius = 16,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
  }) {
    return Material(
      borderRadius: BorderRadius.circular(radius).r,
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(radius).r,
        onTap: onTap,
        child: Padding(
          padding: padding,
          child: this,
        ),
      ),
    );
  }

  InkWell onPressWithoutEffect(
    void Function()? onTap, {
    double radius = 16,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(radius).r,
      onTap: onTap,
      child: this,
    );
  }
}

extension GestureDetectorExt on Widget {
  GestureDetector onTap({
    void Function()? onTap,
    void Function()? onDoubleTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: this,
    );
  }
}

extension SplashAnimationExt on Widget {
  Animate splashAnimation({
    void Function(AnimationController)? onComplete,
  }) {
    return animate(onComplete: onComplete)
        .scale(
          begin: Offset.zero,
          end: const Offset(1.25, 1.25),
          curve: Curves.easeOut,
        )
        .then()
        .scale(
          begin: const Offset(1.25, 1.25),
          end: const Offset(1, 1),
          curve: Curves.easeIn,
        );
  }
}

extension SliverToBoxAdapterExtension on Widget {
  SliverToBoxAdapter toBoxAdapter() {
    return SliverToBoxAdapter(child: this);
  }
}
