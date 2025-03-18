import '../../design_system.dart';
import 'package:flutter/material.dart';

class SliverIndexedStack extends StatelessWidget {
  const SliverIndexedStack({
    required this.children,
    required this.index,
    super.key,
  });

  final List<Widget> children;
  final int index;

  @override
  Widget build(BuildContext context) {
    final wrappedChildren = List<Widget>.generate(children.length, (int i) {
      return SliverVisibility(
        visible: i == index,
        maintainState: true,
        sliver: children[i],
      );
    });
    return SliverStack(
      children: wrappedChildren,
    );
  }
}
