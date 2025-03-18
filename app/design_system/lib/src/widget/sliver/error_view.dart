import '../../../design_system.dart';
import 'package:flutter/material.dart';

class CustomSliverErrorView extends StatelessWidget {
  const CustomSliverErrorView({
    required this.message,
    this.bottomPadding = 0,
    super.key,
  });

  final String message;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      fillOverscroll: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: AppTextConstants.style14W500,
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
          SizedBox(height: bottomPadding),
        ],
      ),
    );
  }
}
