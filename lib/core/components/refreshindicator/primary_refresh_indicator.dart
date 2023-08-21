import 'package:flutter/material.dart';

import '../../extensions/double_extension.dart';
import '../../resources/colors.dart';

class PrimaryRefreshIndicator extends StatelessWidget {
  final Widget child;
  final RefreshCallback onRefresh;
  final double? edgeOffset;

  const PrimaryRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
    this.edgeOffset,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: BaseColors.primaryDarkOrange,
      onRefresh: onRefresh,
      edgeOffset: edgeOffset.ifNull(0),
      child: child,
    );
  }
}
