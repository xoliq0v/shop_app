import 'package:flutter/material.dart';

extension ScrollControllerExt on ScrollController {
  bool isReadyPagination() {
    return position.pixels == position.maxScrollExtent;
  }
}
