import '../../../design_system.dart';
import 'package:flutter/cupertino.dart';

class CustomInfoView extends StatelessWidget {
  const CustomInfoView({
    required this.message,
    super.key,
    this.padding = EdgeInsets.zero,
  });

  final String message;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
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
