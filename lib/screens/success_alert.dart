import 'package:alertus/core/resources/colors.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_white.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SuccessAlert extends StatelessWidget {
  const SuccessAlert({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: BaseColors.primaryLightOrange,
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 140.h),
            Lottie.asset(
              'assets/lotties/success.json',
              height: 220.h,
            ),
            Text(
              "Success !",
              style: GilroyFontWhite.bold30(context).copyWith(fontSize: 36.sp),
            ),
            Text(
              message,
              style: GilroyFontWhite.medium24(context),
            ),
          ],
        ),
      ),
    );
  }
}
