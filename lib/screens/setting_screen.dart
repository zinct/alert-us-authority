import 'package:alertus/core/components/buttons/primary_button.dart';
import 'package:alertus/core/components/textfields/primary_text_field.dart';
import 'package:alertus/core/resources/colors.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_black.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_custom.dart';
import 'package:alertus/core/widgets/touchable_opacity_widget.dart';
import 'package:alertus/screens/success_alert.dart';
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
  bool family = true;
  bool iot = false;
  bool anonymous = false;
  bool crash = false;
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
        child: Column(
          children: [
            Expanded(
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
                          "IOT Product",
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
                          "Crash Detection",
                          style: GilroyFontBlack.regular18(context),
                        ),
                        Switch(
                          value: crash,
                          activeColor: BaseColors.primaryLightOrange,
                          onChanged: (value) {
                            setState(() {
                              crash = !crash;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text(
                          "Auto Call",
                          style: GilroyFontBlack.bold18(context),
                        ),
                        const Spacer(),
                      ],
                    ),
                    SizedBox(height: 10.h),
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
                              family = !family;
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
                          value: family,
                          activeColor: BaseColors.primaryLightOrange,
                          onChanged: (value) {
                            setState(() {
                              family = !family;
                              police = !police;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add Gesture",
                          style: GilroyFontBlack.bold18(context),
                        ),
                        TouchableOpacityWidget(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              builder: (context) {
                                return Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25),
                                    ),
                                  ),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Wrap(
                                    spacing: 20,
                                    runSpacing: 20,
                                    children: [
                                      SizedBox(height: 20.h),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Add Gesture",
                                                    style:
                                                        GilroyFontBlack.bold18(
                                                            context),
                                                  ),
                                                  SizedBox(height: 10.h),
                                                  const PrimaryTextField(
                                                    hintText: "Add Gesture",
                                                    readOnly: true,
                                                    suffix: Icon(Icons
                                                        .keyboard_arrow_down),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 20.w),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Menu Touch",
                                                    style:
                                                        GilroyFontBlack.bold18(
                                                            context),
                                                  ),
                                                  SizedBox(height: 10.h),
                                                  const PrimaryTextField(
                                                    hintText: "Menu Touch",
                                                    readOnly: true,
                                                    suffix: Icon(Icons
                                                        .keyboard_arrow_down),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20.h),
                                      SafeArea(
                                        top: false,
                                        child: Column(
                                          children: [
                                            PrimaryButton(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                text: "Add Gesture"),
                                            SizedBox(height: 20.h),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: const Icon(
                            Icons.add,
                            color: BaseColors.primaryLightOrange,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Button SOS",
                          style: GilroyFontBlack.regular18(context),
                        ),
                        Text(
                          "Touch menu 3x",
                          style: GilroyFontBlack.regular18(context),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Primary Contact",
                          style: GilroyFontBlack.regular18(context),
                        ),
                        Text(
                          "Touch menu 2x",
                          style: GilroyFontBlack.regular18(context),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Fake Call",
                          style: GilroyFontBlack.regular18(context),
                        ),
                        Text(
                          "Touch menu 1x",
                          style: GilroyFontBlack.regular18(context),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
            SafeArea(
              top: false,
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  PrimaryButton(
                    onTap: () async {
                      await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return SuccessAlert(
                            message: "Setting Emergency Button",
                          );
                        },
                      ));
                      Navigator.of(context).pop();
                    },
                    text: "Confirm",
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
