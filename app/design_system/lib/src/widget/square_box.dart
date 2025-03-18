import '../../design_system.dart';
import 'package:flutter/material.dart';

class SquareBox extends StatelessWidget {
  const SquareBox({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppDesignConstants.radius12,
      ),
      child: SizedBox.square(
        dimension: 36.r,
        child: Padding(
          padding: REdgeInsets.all(4),
          child: child,
        ),
      ),
    );
  }
}
