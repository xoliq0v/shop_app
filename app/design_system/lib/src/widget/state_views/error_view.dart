import '../../../design_system.dart';
import 'package:flutter/material.dart';

class CustomErrorView extends StatelessWidget {
  const CustomErrorView({
    required this.message,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
    this.mainAxisAlignment = MainAxisAlignment.start,
    super.key,
  });

  final VoidCallback? onPressed;
  final String message;
  final EdgeInsetsGeometry padding;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Text(
            message,
            style: AppTextConstants.style14W500,
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
          16.verticalSpace,
          EcoMaterialButton(
            onPressed: onPressed?.call,
            minWidth: double.infinity,
            child: const Text('Retry', style: AppTextConstants.styleButton),
          ),
        ],
      ),
    );
  }
}
