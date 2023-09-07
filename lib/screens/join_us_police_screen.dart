import 'package:alertus/core/components/buttons/primary_button.dart';
import 'package:alertus/core/components/textfields/primary_text_field.dart';
import 'package:alertus/core/constants/router.dart';
import 'package:alertus/core/resources/colors.dart';
import 'package:alertus/core/resources/svg.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_black.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_custom.dart';
import 'package:alertus/core/widgets/touchable_opacity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/svg.dart';

class JoinUsPoliceScreen extends StatefulWidget {
  const JoinUsPoliceScreen({super.key});

  @override
  State<JoinUsPoliceScreen> createState() => _JoinUsPoliceScreenState();
}

class _JoinUsPoliceScreenState extends State<JoinUsPoliceScreen> {
  bool isAgreement = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return BaseColors.primaryLightOrange;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 60.w),
                  Text(
                    "Join Us!",
                    style: GilreyFont.bold30(context).copyWith(
                      fontSize: 32.sp,
                      color: BaseColors.fontPrimaryLightOrange,
                    ),
                  ),
                  SizedBox(height: 7.w),
                  Text(
                    "Complete your data to start your adventure!",
                    style: GilreyFont.regular12(context)
                        .copyWith(color: BaseColors.borderPrimaryGrey),
                  ),
                  SizedBox(height: 45.w),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "First Name",
                                  style: GilroyFontBlack.regular12(context)
                                      .copyWith(color: Colors.black),
                                ),
                                Text(
                                  "*",
                                  style: GilroyFontBlack.regular12(context)
                                      .copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.w),
                            const PrimaryTextField(
                              hintText: "First name",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 30.w),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Last Name",
                                  style: GilroyFontBlack.regular12(context)
                                      .copyWith(color: Colors.black),
                                ),
                                Text(
                                  "*",
                                  style: GilroyFontBlack.regular12(context)
                                      .copyWith(color: Colors.red),
                                ),
                                const Spacer(),
                              ],
                            ),
                            SizedBox(height: 10.w),
                            const PrimaryTextField(
                              hintText: "Last name",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.w),
                  Row(
                    children: [
                      Text(
                        "Date of birth",
                        style: GilroyFontBlack.regular12(context)
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        "*",
                        style: GilroyFontBlack.regular12(context)
                            .copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.w),
                  PrimaryTextField(
                    readOnly: true,
                    hintText: "dd/mm/yy",
                    onTap: () async {
                      await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 399999)));
                    },
                  ),
                  SizedBox(height: 20.w),
                  Row(
                    children: [
                      Text(
                        "Government agencies ",
                        style: GilroyFontBlack.regular12(context)
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        "*",
                        style: GilroyFontBlack.regular12(context)
                            .copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.w),
                  PrimaryTextField(
                    hintText: "Agency",
                  ),
                  SizedBox(height: 20.w),
                  Row(
                    children: [
                      Text(
                        "Employee code ",
                        style: GilroyFontBlack.regular12(context)
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        "*",
                        style: GilroyFontBlack.regular12(context)
                            .copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.w),
                  PrimaryTextField(
                    hintText: "Your code employee",
                  ),
                  SizedBox(height: 20.w),
                  Row(
                    children: [
                      Text(
                        "Address",
                        style: GilroyFontBlack.regular12(context)
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        " *",
                        style: GilroyFontBlack.regular12(context)
                            .copyWith(color: Colors.red),
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: 10.w),
                  const PrimaryTextField(
                    hintText: "Enter address",
                    isMultiLine: true,
                  ),
                  SizedBox(height: 20.w),
                  Row(
                    children: [
                      SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: Checkbox(
                          checkColor: BaseColors.fontPrimaryLightOrange,
                          value: isAgreement,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          onChanged: (value) {
                            setState(() {
                              isAgreement = value ?? false;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "I agree to the ",
                        style: GilroyFontBlack.regular10(context)
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        "Terms & Conditions",
                        style: GilroyFontBlack.bold10(context)
                            .copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.w),
                  PrimaryButton(
                      onTap: () {
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        }
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        }
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        }
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        }
                        Navigator.of(context)
                            .pushReplacementNamed(ROUTER.home_police);
                      },
                      text: "Register"),
                  SizedBox(height: 140.w),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
