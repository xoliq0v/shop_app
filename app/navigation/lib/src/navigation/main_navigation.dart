
import 'package:flutter/material.dart';

abstract class MainNavigation {

  Future<void> navigateMainPage();

  Future<void> navigateLostConnectionPage({
    required BuildContext context,
    required void Function(bool) onResult,
  });



}