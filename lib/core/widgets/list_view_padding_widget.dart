import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extensions/double_extension.dart';

enum ListItemsPaddingType { horizontal, vertical }

class ListItemsPaddingWidget extends StatelessWidget {
  final int index;
  final Widget child;
  final ListItemsPaddingType type;
  final double? verticalPadding;

  const ListItemsPaddingWidget({
    super.key,
    required this.index,
    required this.child,
    this.type = ListItemsPaddingType.vertical,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: type == ListItemsPaddingType.horizontal
          ? EdgeInsets.only(
              left: index == 0 ? 20.w : 0,
              right: 20.w,
            )
          : EdgeInsets.only(
              top: index == 0 ? verticalPadding.ifNull(0) : 20.w,
              bottom: verticalPadding.ifNull(0).w,
            ),
      child: child,
    );
  }
}
