import 'package:alertus/core/resources/colors.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_black.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool audio = false;
  bool camera = false;
  bool location = false;
  bool police = false;
  bool family = false;
  bool iot = false;
  bool anonymous = false;
  List<Map<String, String>> gestures = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Settings",
                style: GilreyFont.bold24(context)
                    .copyWith(color: BaseColors.primaryLightOrange),
              ),
              SizedBox(height: 2.w),
              Text(
                "Emergency Button",
                style: GilroyFontBlack.bold18(context),
              ),
              SizedBox(height: 53.h),
              Row(
                children: [
                  Text(
                    "Emergency Button",
                    style: GilroyFontBlack.bold18(context),
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Record Audio",
                    style: GilroyFontBlack.regular18(context),
                  ),
                  Switch(
                    value: audio,
                    activeColor: BaseColors.primaryLightOrange,
                    onChanged: (value) {
                      setState(() {
                        audio = !audio;
                      });
                    },
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Camera",
                    style: GilroyFontBlack.regular18(context),
                  ),
                  Switch(
                    value: camera,
                    activeColor: BaseColors.primaryLightOrange,
                    onChanged: (value) {
                      setState(() {
                        camera = !camera;
                      });
                    },
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Location",
                    style: GilroyFontBlack.regular18(context),
                  ),
                  Switch(
                    value: location,
                    activeColor: BaseColors.primaryLightOrange,
                    onChanged: (value) {
                      setState(() {
                        location = !location;
                      });
                    },
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Emergency Police",
                    style: GilroyFontBlack.regular18(context),
                  ),
                  Switch(
                    value: police,
                    activeColor: BaseColors.primaryLightOrange,
                    onChanged: (value) {
                      setState(() {
                        police = !police;
                      });
                    },
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Family Contact",
                    style: GilroyFontBlack.regular18(context),
                  ),
                  Switch(
                    value: iot,
                    activeColor: BaseColors.primaryLightOrange,
                    onChanged: (value) {
                      setState(() {
                        iot = !iot;
                      });
                    },
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Anonymous Vibes",
                    style: GilroyFontBlack.regular18(context),
                  ),
                  Switch(
                    value: anonymous,
                    activeColor: BaseColors.primaryLightOrange,
                    onChanged: (value) {
                      setState(() {
                        anonymous = !anonymous;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    "Add Gesture",
                    style: GilroyFontBlack.bold18(context),
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
