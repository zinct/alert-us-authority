import 'package:alertus/core/components/buttons/primary_button.dart';
import 'package:alertus/core/components/textfields/primary_text_field.dart';
import 'package:alertus/core/resources/colors.dart';
import 'package:alertus/core/resources/images.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_black.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_custom.dart';
import 'package:alertus/screens/success_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddContactScreen extends StatelessWidget {
  const AddContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Add Contact",
                      style: GilreyFont.bold24(context)
                          .copyWith(color: BaseColors.primaryLightOrange),
                    ),
                    SizedBox(height: 2.w),
                    Text(
                      "Family Emergency",
                      style: GilroyFontBlack.bold18(context),
                    ),
                    SizedBox(height: 53.h),
                    Image.asset(BaseImages.placeholder),
                    SizedBox(height: 32.h),
                    Row(
                      children: [
                        Text(
                          "Your full name?",
                          style: GilroyFontBlack.medium14(context),
                        ),
                        Text(
                          "*",
                          style: GilroyFontBlack.medium14(context)
                              .copyWith(color: Colors.red),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    const PrimaryTextField(
                      hintText: "Full name",
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          "Status with you?",
                          style: GilroyFontBlack.medium14(context),
                        ),
                        Text(
                          "*",
                          style: GilroyFontBlack.medium14(context)
                              .copyWith(color: Colors.red),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    const PrimaryTextField(
                      hintText: "Status",
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          "Phone number",
                          style: GilroyFontBlack.medium14(context),
                        ),
                        Text(
                          "*",
                          style: GilroyFontBlack.medium14(context)
                              .copyWith(color: Colors.red),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    const PrimaryTextField(
                      hintText: "Phone number",
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          "Email",
                          style: GilroyFontBlack.medium14(context),
                        ),
                        Text(
                          "*",
                          style: GilroyFontBlack.medium14(context)
                              .copyWith(color: Colors.red),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    const PrimaryTextField(
                      hintText: "Email",
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
              const Spacer(),
              SafeArea(
                top: false,
                child: PrimaryButton(
                    onTap: () async {
                      await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return SuccessAlert(
                            message: "contact has been added",
                          );
                        },
                      ));
                      Navigator.of(context).pop();
                    },
                    text: "Confirm"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
