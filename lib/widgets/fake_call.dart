import 'package:alertus/core/resources/colors.dart';
import 'package:alertus/core/resources/images.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_white.dart';
import 'package:alertus/core/widgets/touchable_opacity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FakeCall extends StatefulWidget {
  const FakeCall({super.key, required this.onTap, required this.minute});

  final Function() onTap;
  final String minute;

  @override
  State<FakeCall> createState() => _FakeCallState();
}

class _FakeCallState extends State<FakeCall> {
  @override
  Widget build(BuildContext context) {
    return TouchableOpacityWidget(
      onTap: widget.onTap,
      child: Stack(
        children: [
          Container(
            color: Colors.black.withOpacity(.6),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 180.h,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 45.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 6,
                    ),
                    color: BaseColors.primaryLightOrange,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 40.h),
                      Image.asset(BaseImages.police),
                      SizedBox(height: 20.h),
                      Text(
                        "FAKE POLICE",
                        style: GilroyFontWhite.bold24(context),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        widget.minute,
                        style: GilroyFontWhite.bold16(context),
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
