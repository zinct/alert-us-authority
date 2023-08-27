import 'package:alertus/core/components/buttons/primary_button.dart';
import 'package:alertus/core/components/textfields/primary_text_field.dart';
import 'package:alertus/core/constants/router.dart';
import 'package:alertus/core/resources/colors.dart';
import 'package:alertus/core/resources/images.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_black.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_custom.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_white.dart';
import 'package:alertus/core/widgets/touchable_opacity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.primaryLightOrange,
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(BaseImages.roleLogo),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(46),
                      topRight: Radius.circular(46),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 113.w),
                      Text(
                        "Welcome!",
                        style: GilreyFont.bold30(context).copyWith(
                          fontSize: 32.sp,
                          color: BaseColors.fontPrimaryLightOrange,
                        ),
                      ),
                      SizedBox(height: 21.w),
                      const PrimaryTextField(
                        hintText: "Enter e-mail",
                      ),
                      SizedBox(height: 20.w),
                      const PrimaryTextField(
                        hintText: "Enter Password",
                        suffix: Icon(
                          Icons.remove_red_eye_outlined,
                        ),
                      ),
                      SizedBox(height: 20.w),
                      PrimaryButton(
                          onTap: () {
                            Navigator.of(context).pushNamed(ROUTER.home);
                          },
                          text: "Log in"),
                      SizedBox(height: 20.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Forgot your login detail?",
                            style: GilreyFont.regular10(context),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            "Get help signing in",
                            style: GilreyFont.bold10(context),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SafeArea(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Dont't have an account?",
                              style: GilreyFont.regular12(context),
                            ),
                            SizedBox(width: 5.w),
                            TouchableOpacityWidget(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(ROUTER.register);
                              },
                              child: Text(
                                "Create Account.",
                                style: GilreyFont.bold12(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.w),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
