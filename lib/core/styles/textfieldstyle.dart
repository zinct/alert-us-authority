import 'package:alertus/core/styles/textstyles/gilroy_font_black.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors.dart';

class EliteTextFieldTheme {
  final EdgeInsetsGeometry contentPadding;
  final TextStyle hintStyle, textStyle;
  final InputBorder border,
      focusedBorder,
      errorBorder,
      disabledBorder,
      focusedErrorBorder,
      enabledBorder;
  final Color? fillColor;

  const EliteTextFieldTheme({
    required this.contentPadding,
    required this.hintStyle,
    required this.textStyle,
    required this.border,
    required this.focusedBorder,
    required this.errorBorder,
    required this.disabledBorder,
    required this.focusedErrorBorder,
    required this.enabledBorder,
    this.fillColor,
  });
}

EliteTextFieldTheme defaultEliteTextFieldTheme({
  required BuildContext context,
  BorderRadius? radius,
  EdgeInsets? contentPadding,
  Color? borderColor,
}) {
  return EliteTextFieldTheme(
    contentPadding: contentPadding ??
        EdgeInsets.only(
          left: 15.w,
          top: 20.w,
          bottom: 20.w,
          right: 15.w,
        ),
    hintStyle: GilreyFont.regular14(context,
        color: borderColor ?? BaseColors.borderPrimaryGrey),
    textStyle: GilroyFontBlack.regular14(context),
    border: OutlineInputBorder(
      borderRadius: radius ??
          BorderRadius.all(
            Radius.circular(8.w),
          ),
      borderSide: BorderSide(
        color: borderColor ?? BaseColors.borderPrimaryGrey,
        width: 1.w,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: radius ??
          BorderRadius.all(
            Radius.circular(8.w),
          ),
      borderSide: BorderSide(
        color: borderColor ?? BaseColors.borderPrimaryGrey,
        width: 1.w,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: radius ??
          BorderRadius.all(
            Radius.circular(8.w),
          ),
      borderSide: BorderSide(
        color: Colors.red,
        width: 1.w,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: radius ??
          BorderRadius.all(
            Radius.circular(8.w),
          ),
      borderSide: BorderSide(
        color: borderColor ?? BaseColors.borderPrimaryGrey,
        width: 1.w,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: radius ??
          BorderRadius.all(
            Radius.circular(8.w),
          ),
      borderSide: BorderSide(
        color: borderColor ?? BaseColors.borderPrimaryGrey,
        width: 1.w,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: radius ??
          BorderRadius.all(
            Radius.circular(8.w),
          ),
      borderSide: BorderSide(
        color: borderColor ?? BaseColors.borderPrimaryGrey,
        width: 1.w,
      ),
    ),
  );
}

EliteTextFieldTheme primaryOutlinedTextFieldTheme({
  required BuildContext context,
  BorderRadius? radius,
  EdgeInsets? contentPadding,
  Color? borderColor,
}) {
  return EliteTextFieldTheme(
    contentPadding: contentPadding ??
        EdgeInsets.only(
          left: 15.w,
          top: 15.w,
          bottom: 15.w,
          right: 15.w,
        ),
    hintStyle: GilreyFont.regular14(context,
        color: borderColor ?? BaseColors.borderPrimaryGrey),
    textStyle: GilroyFontBlack.regular14(context),
    border: UnderlineInputBorder(
      borderRadius: radius ??
          BorderRadius.all(
            Radius.circular(8.w),
          ),
      borderSide: BorderSide(
        color: borderColor ?? BaseColors.borderPrimaryGrey,
        width: 1.w,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderRadius: radius ??
          BorderRadius.all(
            Radius.circular(8.w),
          ),
      borderSide: BorderSide(
        color: borderColor ?? BaseColors.borderPrimaryGrey,
        width: 1.w,
      ),
    ),
    errorBorder: UnderlineInputBorder(
      borderRadius: radius ??
          BorderRadius.all(
            Radius.circular(8.w),
          ),
      borderSide: BorderSide(
        color: Colors.red,
        width: 1.w,
      ),
    ),
    disabledBorder: UnderlineInputBorder(
      borderRadius: radius ??
          BorderRadius.all(
            Radius.circular(8.w),
          ),
      borderSide: BorderSide(
        color: borderColor ?? BaseColors.borderPrimaryGrey,
        width: 1.w,
      ),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderRadius: radius ??
          BorderRadius.all(
            Radius.circular(8.w),
          ),
      borderSide: BorderSide(
        color: borderColor ?? BaseColors.borderPrimaryGrey,
        width: 1.w,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderRadius: radius ??
          BorderRadius.all(
            Radius.circular(8.w),
          ),
      borderSide: BorderSide(
        color: borderColor ?? BaseColors.borderPrimaryGrey,
        width: 1.w,
      ),
    ),
  );
}
