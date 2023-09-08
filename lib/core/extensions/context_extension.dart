///
/// context_extension.dart
/// lib/core/extensions
///
///
///

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double? sizeWidth() {
    return size?.width;
  }

  double? sizeHeight() {
    return size?.height;
  }
}
