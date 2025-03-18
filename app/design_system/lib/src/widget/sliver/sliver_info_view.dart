import '../../../design_system.dart';
import 'package:flutter/material.dart';

class CustomSliverInfoView extends StatelessWidget {
  const CustomSliverInfoView({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      fillOverscroll: true,
      child: Center(
        child: Text(
          message,
          style: AppTextConstants.style14W500,
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ),
    );
  }
}
