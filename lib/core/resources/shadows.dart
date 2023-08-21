import 'package:flutter/material.dart';

class BaseShadows {
  static List<BoxShadow> primary = [
    BoxShadow(
      blurRadius: 4,
      offset: const Offset(0, 4),
      color: Colors.black.withOpacity(.05),
    ),
  ];
}
