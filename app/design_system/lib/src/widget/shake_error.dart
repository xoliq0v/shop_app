import 'dart:math' show pi, sin;

import 'state_views/animation_controller_state_view.dart';
import 'package:flutter/material.dart';

class ShakeWidget extends StatefulWidget {
  const ShakeWidget({
    required this.child,
    required this.shakeOffset,
    super.key,
    this.shakeCount = 3,
    this.shakeDuration = const Duration(milliseconds: 400),
  });

  final Widget child;
  final double shakeOffset;
  final int shakeCount;
  final Duration shakeDuration;

  @override
  State<ShakeWidget> createState() => ShakeWidgetState(shakeDuration);
}

class ShakeWidgetState extends AnimationControllerState<ShakeWidget> {
  ShakeWidgetState(super.animationDuration);

  @override
  void initState() {
    super.initState();
    animationController.addStatusListener(_updateStatus);
  }

  @override
  void dispose() {
    animationController.removeStatusListener(_updateStatus);
    super.dispose();
  }

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.reset();
    }
  }

  void shake() {
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: widget.child,
      builder: (context, child) {
        final sineValue = sin(
          widget.shakeCount * 2 * pi * animationController.value,
        );
        return Transform.translate(
          offset: Offset(sineValue * widget.shakeOffset, 0),
          child: child,
        );
      },
    );
  }
}
