import 'package:alertus/core/components/buttons/primary_button.dart';
import 'package:alertus/core/constants/router.dart';
import 'package:alertus/core/resources/images.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_white.dart';
import 'package:alertus/core/widgets/touchable_opacity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaceRecognitionScreen extends StatelessWidget {
  const FaceRecognitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              BaseImages.face,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      SizedBox(width: 20.w),
                      TouchableOpacityWidget(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Face Recognition",
                        style: GilroyFontWhite.bold20(context),
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      Spacer(),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: PrimaryButton(
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
                              .pushReplacementNamed(ROUTER.home);
                        },
                        text: "Confirm"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
