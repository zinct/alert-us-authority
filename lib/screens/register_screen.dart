import 'package:alertus/core/components/buttons/primary_button.dart';
import 'package:alertus/core/components/textfields/primary_text_field.dart';
import 'package:alertus/core/constants/router.dart';
import 'package:alertus/core/resources/colors.dart';
import 'package:alertus/core/resources/images.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_black.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_custom.dart';
import 'package:alertus/core/widgets/touchable_opacity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                    "Registrasi",
                    style: GilreyFont.bold30(context).copyWith(
                      fontSize: 32.sp,
                      color: BaseColors.fontPrimaryLightOrange,
                    ),
                  ),
                  SizedBox(height: 19.w),
                  Text(
                    "Register your account first to start the fun experience!",
                    style: GilreyFont.regular12(context)
                        .copyWith(color: BaseColors.borderPrimaryGrey),
                  ),
                  SizedBox(height: 45.w),
                  Row(
                    children: [
                      Text(
                        "Username",
                        style: GilroyFontBlack.regular12(context)
                            .copyWith(color: Colors.black),
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: 10.w),
                  const PrimaryTextField(
                    hintText: "Masukan nomor atau username",
                  ),
                  SizedBox(height: 20.w),
                  Row(
                    children: [
                      Text(
                        "Password",
                        style: GilroyFontBlack.regular12(context)
                            .copyWith(color: Colors.black),
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: 10.w),
                  const PrimaryTextField(
                    hintText: "Masukan Password",
                    suffix: Icon(
                      Icons.remove_red_eye_outlined,
                    ),
                  ),
                  SizedBox(height: 20.w),
                  Row(
                    children: [
                      Text(
                        "Confirm Password",
                        style: GilroyFontBlack.regular12(context)
                            .copyWith(color: Colors.black),
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: 10.w),
                  const PrimaryTextField(
                    hintText: "Ketik ulang Password",
                    suffix: Icon(
                      Icons.remove_red_eye_outlined,
                    ),
                  ),
                  SizedBox(height: 80.w),
                  PrimaryButton(onTap: () {}, text: "Log in"),
                  SizedBox(height: 20.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: GilreyFont.regular10(context),
                      ),
                      SizedBox(width: 5.w),
                      TouchableOpacityWidget(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Login now",
                          style: GilreyFont.bold10(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
