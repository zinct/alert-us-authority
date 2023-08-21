import 'package:alertus/core/constants/router.dart';
import 'package:alertus/core/resources/colors.dart';
import 'package:alertus/core/resources/images.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_black.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_white.dart';
import 'package:alertus/core/widgets/touchable_opacity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});

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
                child: Image.asset(BaseImages.roleLogo),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(46),
                      topRight: Radius.circular(46),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 44.w,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 86.w),
                      Text(
                        "Silahkan pilih tipe akun yang sesuai untukmu!",
                        style: GilroyFontBlack.medium16(context),
                      ),
                      SizedBox(height: 21.w),
                      TouchableOpacityWidget(
                        onTap: () {
                          Navigator.of(context).pushNamed(ROUTER.login);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 19.w,
                            horizontal: 26.w,
                          ),
                          decoration: BoxDecoration(
                            color: BaseColors.fontPrimaryLightOrange,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pengguna",
                                    style: GilroyFontWhite.bold20(context),
                                  ),
                                  Text(
                                    "Pastikan diri kamu aman",
                                    style: GilroyFontWhite.regular12(context),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 20.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.w),
                      TouchableOpacityWidget(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 19.w,
                            horizontal: 26.w,
                          ),
                          decoration: BoxDecoration(
                            color: BaseColors.primaryDarkOrange,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pihak Berwajib",
                                    style: GilroyFontWhite.bold20(context),
                                  ),
                                  Text(
                                    "Pantau keamanan sekitar",
                                    style: GilroyFontWhite.regular12(context),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 20.w,
                              ),
                            ],
                          ),
                        ),
                      ),
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
