import 'package:alertus/core/resources/colors.dart';
import 'package:alertus/core/resources/images.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_black.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_white.dart';
import 'package:alertus/core/widgets/touchable_opacity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackScreen extends StatelessWidget {
  const TrackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
              ),
              child: SafeArea(
                bottom: false,
                child: Container(
                  width: double.infinity,
                  color: BaseColors.fontPrimaryLightOrange,
                  child: SafeArea(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 10.w),
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
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "Report",
                          style: GilroyFontWhite.bold24(context),
                        ),
                        SizedBox(height: 2.w),
                        Text(
                          "General Account",
                          style: GilroyFontBlack.regular20(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Center(
                    child: Text(
                      "Reporting Information",
                      style: GilroyFontBlack.bold16(context),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Center(
                    child: Image.asset(
                      BaseImages.dummyPeople,
                      height: 223.w,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Center(
                    child: Text(
                      "Caecarryo",
                      style: GilroyFontBlack.bold20(context),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  TouchableOpacityWidget(
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Container(
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
                                  "Show Track Location",
                                  style: GilroyFontBlack.bold18(context),
                                ),
                                SizedBox(height: 10.h),
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
                  ),
                  SizedBox(height: 57.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Emergency Button",
                            style: GilroyFontBlack.bold18(context),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            "Emergency contact number as needed",
                            style: GilroyFontBlack.regular14(context),
                          ),
                        ],
                      ),
                      TouchableOpacityWidget(
                        onTap: () {},
                        child: Text(
                          "View All",
                          style: GilroyFontBlack.bold16(context).copyWith(
                            color: BaseColors.primaryLightOrange,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Card(
                    shape: const RoundedRectangleBorder(),
                    margin: EdgeInsets.zero,
                    shadowColor: const Color(0xFFECF3F6).withOpacity(.06),
                    child: ListTile(
                      leading: Image.asset(BaseImages.logoPolice),
                      title: Text(
                        "Police Office",
                        style: GilroyFontBlack.regular16(context),
                      ),
                      subtitle: Text(
                        "110",
                        style: GilroyFontBlack.regular14(context),
                      ),
                      trailing: const CircleAvatar(
                        backgroundColor: BaseColors.primaryLightGreen,
                        child: Icon(
                          Icons.phone_in_talk_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: const RoundedRectangleBorder(),
                    margin: EdgeInsets.zero,
                    shadowColor: const Color(0xFFECF3F6).withOpacity(.06),
                    child: ListTile(
                      leading: Image.asset(BaseImages.logoFirefighter),
                      title: Text(
                        "Fire Department",
                        style: GilroyFontBlack.regular16(context),
                      ),
                      subtitle: Text(
                        "113",
                        style: GilroyFontBlack.regular14(context),
                      ),
                      trailing: const CircleAvatar(
                        backgroundColor: BaseColors.primaryLightGreen,
                        child: Icon(
                          Icons.phone_in_talk_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: const RoundedRectangleBorder(),
                    margin: EdgeInsets.zero,
                    shadowColor: const Color(0xFFECF3F6).withOpacity(.06),
                    child: ListTile(
                      leading: Image.asset(BaseImages.logoSar),
                      title: Text(
                        "SAR / Search and Rescue",
                        style: GilroyFontBlack.regular16(context),
                      ),
                      subtitle: Text(
                        "115",
                        style: GilroyFontBlack.regular14(context),
                      ),
                      trailing: const CircleAvatar(
                        backgroundColor: BaseColors.primaryLightGreen,
                        child: Icon(
                          Icons.phone_in_talk_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: const RoundedRectangleBorder(),
                    margin: EdgeInsets.zero,
                    shadowColor: const Color(0xFFECF3F6).withOpacity(.06),
                    elevation: 2,
                    child: ListTile(
                      leading: Image.asset(BaseImages.logoHospital),
                      title: Text(
                        "Ambulance",
                        style: GilroyFontBlack.regular16(context),
                      ),
                      subtitle: Text(
                        "118/119",
                        style: GilroyFontBlack.regular14(context),
                      ),
                      trailing: const CircleAvatar(
                        backgroundColor: BaseColors.primaryLightGreen,
                        child: Icon(
                          Icons.phone_in_talk_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
