import '../../../design_system.dart';
import 'package:flutter/material.dart';

class BottomLoadingView extends StatelessWidget {
  const BottomLoadingView({required this.loading, super.key});

  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26.h,
      child: loading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : const SizedBox.shrink(),
    );
  }
}
