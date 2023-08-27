import 'package:alertus/core/constants/router.dart';
import 'package:alertus/core/resources/colors.dart';
import 'package:alertus/core/resources/images.dart';
import 'package:alertus/core/resources/svg.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_black.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_custom.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_white.dart';
import 'package:alertus/core/widgets/touchable_opacity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: IndexedStack(
                index: index,
                children: [
                  const HomeTab(),
                  Container(),
                  Container(),
                  const ProfileTab(),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 40.w,
              vertical: 17.w,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 22,
                  offset: const Offset(0, -18),
                  color: const Color(0xFFA39CB1).withOpacity(.06),
                )
              ],
            ),
            child: SafeArea(
              top: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TouchableOpacityWidget(
                    onTap: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          BaseSvg.icHome,
                          height: 30.w,
                          color:
                              index == 0 ? BaseColors.primaryLightOrange : null,
                        ),
                        SizedBox(height: 9.w),
                        Text(
                          "Home",
                          style: GilreyFont.medium12(context).copyWith(
                            color: index == 0
                                ? BaseColors.primaryLightOrange
                                : const Color(0xFFBABEC1),
                          ),
                        )
                      ],
                    ),
                  ),
                  TouchableOpacityWidget(
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          BaseSvg.icMaps,
                          height: 20.w,
                          color:
                              index == 1 ? BaseColors.primaryLightOrange : null,
                        ),
                        SizedBox(height: 11.w),
                        Text(
                          "Maps",
                          style: GilreyFont.medium12(context).copyWith(
                            color: index == 1
                                ? BaseColors.primaryLightOrange
                                : const Color(0xFFBABEC1),
                          ),
                        )
                      ],
                    ),
                  ),
                  TouchableOpacityWidget(
                    onTap: () {
                      setState(() {
                        index = 2;
                      });
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          BaseSvg.icPhone,
                          color:
                              index == 2 ? BaseColors.primaryLightOrange : null,
                        ),
                        SizedBox(height: 9.w),
                        Text(
                          "Phone",
                          style: GilreyFont.medium12(context).copyWith(
                            color: index == 2
                                ? BaseColors.primaryLightOrange
                                : const Color(0xFFBABEC1),
                          ),
                        )
                      ],
                    ),
                  ),
                  TouchableOpacityWidget(
                    onTap: () {
                      setState(() {
                        index = 3;
                      });
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          BaseSvg.icUser,
                          color:
                              index == 3 ? BaseColors.primaryLightOrange : null,
                        ),
                        SizedBox(height: 9.w),
                        Text(
                          "Profile",
                          style: GilreyFont.medium12(context).copyWith(
                            color: index == 3
                                ? BaseColors.primaryLightOrange
                                : const Color(0xFFBABEC1),
                          ),
                        )
                      ],
                    ),
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

class HomeTab extends StatelessWidget {
  const HomeTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                BaseImages.overlay,
              ),
              alignment: Alignment.topRight,
            ),
            color: BaseColors.primaryLightOrange,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.w,
          ),
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome to the apps",
                          style: GilroyFontWhite.regular20(context),
                        ),
                        Text(
                          "Caecarryo",
                          style: GilroyFontBlack.bold18(context),
                        ),
                      ],
                    ),
                    Image.asset(BaseImages.icNotification),
                  ],
                ),
                SizedBox(height: 29.w),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 11.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      const BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 15,
                        spreadRadius: 0,
                        color: Color(0xFFECF3F6),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(BaseSvg.icSearch),
                          SizedBox(width: 13.w),
                          Text(
                            "Caecarryo",
                            style: GilroyFontBlack.regular16(context).copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(BaseSvg.icMicrophone),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 36.w),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Emergency Button",
                    style: GilroyFontBlack.bold18(context),
                  ),
                  TouchableOpacityWidget(
                    onTap: () {
                      Navigator.of(context).pushNamed(ROUTER.setting);
                    },
                    child: Text(
                      "Settings",
                      style: GilroyFontBlack.bold16(context).copyWith(
                        color: BaseColors.primaryLightOrange,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.w),
              Text(
                "Are you in emergency?",
                style: GilroyFontBlack.bold24(context),
              ),
              SizedBox(height: 15.w),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Text(
                  "Press the button bellow help will reach you soon.",
                  style: GilroyFontBlack.medium16(context).copyWith(
                    color: BaseColors.borderPrimaryGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30.w),
              Image.asset(BaseImages.sos),
              SizedBox(height: 30.w),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 20.w,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 15,
                        spreadRadius: 0,
                        color: const Color(0xFFECF3F6).withOpacity(.60),
                      )
                    ]),
                child: Row(
                  children: [
                    Image.asset(
                      BaseImages.dummyPeople,
                      height: 55.w,
                    ),
                    SizedBox(width: 30.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your current Address",
                            style: GilroyFontBlack.bold18(context),
                          ),
                          Text(
                            "Perumahan Permata Buahbatu Bojongsoang Bandung, Jawa barat",
                            style: GilroyFontBlack.regular12(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.w),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 20.w,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 15,
                        spreadRadius: 0,
                        color: const Color(0xFFECF3F6).withOpacity(.60),
                      )
                    ]),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fake Call Emergency",
                            style: GilroyFontBlack.bold18(context),
                          ),
                          Row(
                            children: [
                              Text(
                                "Sound : Police Coming",
                                style: GilroyFontBlack.regular12(context),
                              ),
                              const Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 30.w),
                    Image.asset(
                      BaseImages.calldring,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 90.w),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Settings",
                style: GilreyFont.bold24(context)
                    .copyWith(color: BaseColors.primaryLightOrange),
              ),
              SizedBox(height: 2.h),
              Text(
                "General Account",
                style: GilroyFontBlack.regular18(context),
              ),
              SizedBox(height: 53.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Image.asset(
                      BaseImages.dummyPeople,
                      width: 81.w,
                      height: 81.h,
                    ),
                    SizedBox(width: 20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Caecarryo",
                          style: GilroyFontBlack.bold20(context),
                        ),
                        Text(
                          "Edit Profile",
                          style: GilroyFontBlack.regular14(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              const Divider(
                color: Color(0xFFF5F5F5),
                thickness: 4,
              ),
              SizedBox(height: 20.h),
              ListTile(
                leading: SvgPicture.asset(BaseSvg.icBell),
                minLeadingWidth: 24.w,
                title: Text(
                  "Notifications",
                  style: GilroyFontBlack.regular18(context),
                ),
              ),
              ListTile(
                leading: SvgPicture.asset(BaseSvg.icLanguange),
                minLeadingWidth: 24,
                title: Text(
                  "Language",
                  style: GilroyFontBlack.regular18(context),
                ),
              ),
              SizedBox(height: 20.h),
              ListTile(
                leading: SvgPicture.asset(BaseSvg.icInfo),
                minLeadingWidth: 24,
                title: Text(
                  "F.A.Q",
                  style: GilroyFontBlack.regular18(context),
                ),
              ),
              ListTile(
                leading: SvgPicture.asset(BaseSvg.icRefresh),
                minLeadingWidth: 24,
                title: Text(
                  "About Us",
                  style: GilroyFontBlack.regular18(context),
                ),
              ),
              ListTile(
                leading: SvgPicture.asset(BaseSvg.icMessage),
                minLeadingWidth: 24,
                title: Text(
                  "Message",
                  style: GilroyFontBlack.regular18(context),
                ),
              ),
              const Divider(
                color: Color(0xFFF5F5F5),
                thickness: 4,
              ),
              ListTile(
                leading: SvgPicture.asset(BaseSvg.icLogout),
                onTap: () {
                  Navigator.of(context).pop();
                },
                minLeadingWidth: 24,
                title: Text(
                  "Log out",
                  style: GilroyFontBlack.regular18(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
