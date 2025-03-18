import 'package:flutter/material.dart';

class Dash extends StatelessWidget {
  const Dash({
    Key? key,
    this.direction = Axis.horizontal,
    this.dashColor = Colors.black,
    this.length,
    this.dashGap = 3,
    this.dashLength = 6,
    this.dashThickness = 1,
    this.dashBorderRadius = 0,
  }) : super(key: key);

  final Axis direction;
  final Color dashColor;
  final double? length;
  final double dashGap;
  final double dashLength;
  final double dashThickness;
  final double dashBorderRadius;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Get available length: use provided length or fallback to constraints
        double availableLength = length ??
            (direction == Axis.horizontal ? constraints.maxWidth : constraints.maxHeight);

        // Calculate number of dashes and gap spacing
        double n = (availableLength + dashGap) / (dashGap + dashLength);
        int newN = n.floor(); // Use floor to prevent over-allocation
        double newDashGap = (availableLength - dashLength * newN) / (newN - 1).clamp(0, double.infinity);

        // Create the dashes
        var dashes = List.generate(newN, (index) => step(index, newDashGap));

        // Render as row or column based on direction
        if (direction == Axis.horizontal) {
          return SizedBox(
            width: availableLength,
            child: Row(
              children: dashes,
            ),
          );
        } else {
          return SizedBox(
            height: availableLength,
            child: Column(
              children: dashes,
            ),
          );
        }
      },
    );
  }

  Widget step(int index, double newDashGap) {
    bool isHorizontal = direction == Axis.horizontal;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        0,
        isHorizontal && index != 0 ? newDashGap : 0,
        isHorizontal || index == 0 ? 0 : newDashGap,
      ),
      child: SizedBox(
        width: isHorizontal ? dashLength : dashThickness,
        height: isHorizontal ? dashThickness : dashLength,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: dashColor,
            borderRadius: BorderRadius.all(Radius.circular(dashBorderRadius)),
          ),
        ),
      ),
    );
  }
}