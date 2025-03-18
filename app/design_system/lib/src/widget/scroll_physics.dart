import 'package:flutter/material.dart';

class CustomScrollPhysics extends ScrollPhysics {
  const CustomScrollPhysics({super.parent});

  @override
  ScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    if (value > position.pixels) {
      return 0;
    } else if (value < position.pixels) {
      if (position.pixels <= position.minScrollExtent) {
        return value - position.pixels;
      }
    }
    return 0;
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const CustomScrollPhysics(parent: BouncingScrollPhysics());
  }
}
