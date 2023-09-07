import 'package:alertus/core/resources/colors.dart';
import 'package:alertus/core/resources/images.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_white.dart';
import 'package:alertus/core/widgets/touchable_opacity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SOS extends StatefulWidget {
  const SOS({super.key, required this.onTap});

  final Function() onTap;

  @override
  State<SOS> createState() => _SOSState();
}

class _SOSState extends State<SOS> {
  bool isEnd = false;
  bool isEnding = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handleEnd();
    print("OK");
  }

  void handleEnd() async {
    await Future.delayed(Duration(milliseconds: 600));
    setState(() {
      isEnd = true;
    });
    await Future.delayed(Duration(milliseconds: 600));
    setState(() {
      isEnding = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TouchableOpacityWidget(
      onTap: isEnd == false ? () {} : widget.onTap,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      isEnding ? Container() : SizedBox(height: 100.h),
                      isEnding
                          ? Lottie.asset(
                              'assets/lotties/success.json',
                              height: 200.h,
                            )
                          : !isEnd
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(BaseImages.policeCar),
                                    SizedBox(width: 20.w),
                                    Text(
                                      "Police on the way...",
                                      style: GilroyFontWhite.medium20(context),
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Police on the way...",
                                      style: GilroyFontWhite.medium20(context),
                                    ),
                                    SizedBox(width: 20.w),
                                    Image.asset(BaseImages.policeCar),
                                  ],
                                ),
                      isEnding
                          ? SizedBox(height: 20.h)
                          : SizedBox(height: 70.h),
                      Text(
                        "Ensure Your Safety Before We Arrive",
                        style: GilroyFontWhite.bold16(context),
                      ),
                      SizedBox(height: 50.h),
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
