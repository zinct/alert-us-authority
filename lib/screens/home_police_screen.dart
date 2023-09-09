import 'package:alertus/core/components/buttons/primary_button.dart';
import 'package:alertus/core/constants/router.dart';
import 'package:alertus/core/resources/colors.dart';
import 'package:alertus/core/resources/images.dart';
import 'package:alertus/core/resources/svg.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_black.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_custom.dart';
import 'package:alertus/core/styles/textstyles/gilroy_font_white.dart';
import 'package:alertus/core/widgets/touchable_opacity_widget.dart';
import 'package:alertus/widgets/fake_call.dart';
import 'package:alertus/widgets/sos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomePoliceScreen extends StatefulWidget {
  const HomePoliceScreen({super.key});

  @override
  State<HomePoliceScreen> createState() => _HomePoliceScreenState();
}

class _HomePoliceScreenState extends State<HomePoliceScreen> {
  int index = 0;

  late bool isFakeCall = false;
  late bool isSOS = false;

  late List<Widget> tabs = [
    HomeTab(
      onFakeCall: () {
        setState(() {
          isFakeCall = true;
        });
      },
      onSOS: () {
        setState(() {
          isSOS = true;
        });
      },
    ),
    const ReportTab(),
    MapsTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: tabs[index],
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
                                color: index == 0
                                    ? BaseColors.primaryLightOrange
                                    : null,
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
                                BaseSvg.icChat,
                                color: index == 1
                                    ? BaseColors.primaryLightOrange
                                    : null,
                              ),
                              SizedBox(height: 9.w),
                              Text(
                                "Report",
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
                                BaseSvg.icMaps,
                                height: 20.w,
                                color: index == 2
                                    ? BaseColors.primaryLightOrange
                                    : null,
                              ),
                              SizedBox(height: 11.w),
                              Text(
                                "Maps",
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
                                color: index == 3
                                    ? BaseColors.primaryLightOrange
                                    : null,
                              ),
                              SizedBox(height: 9.w),
                              Text(
                                "Account",
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
          ),
        ],
      ),
    );
  }
}

class MapsTab extends StatefulWidget {
  MapsTab({
    super.key,
  });

  @override
  State<MapsTab> createState() => _MapsTabState();
}

class _MapsTabState extends State<MapsTab> {
  final TransformationController _controller = TransformationController(
    Matrix4.identity().scaled(1.2),
  );

  bool isDangerious = false;
  bool isLocation = true;
  bool isTracked = false;

  @override
  void initState() {
    super.initState();
  }

  String getImage() {
    if (isDangerious) {
      if (isTracked) {
        return BaseImages.mapsPoliceArrowDanger;
      } else {
        return BaseImages.mapsPoliceDanger;
      }
    } else {
      if (isTracked) {
        return BaseImages.mapsPoliceArrow;
      } else {
        return BaseImages.mapsPoliceOriginal;
      }
    }
  }

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
    return Stack(
      children: [
        InteractiveViewer(
          transformationController: _controller,
          minScale: 5,
          maxScale: 10,
          child: Container(
            color: Colors.amber,
            width: double.infinity,
            child: TouchableOpacityWidget(
              onTap: () async {
                final value = await Navigator.of(context)
                    .pushNamed(ROUTER.tracker) as bool?;
                if (value == true) {
                  setState(() {
                    isTracked = value!;
                  });
                }
              },
              child: Image.asset(
                getImage(),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        isLocation == false
            ? SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 20.w),
                    Row(
                      children: [
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: BaseColors.fontPrimaryLightOrange,
                              width: 3,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 7.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Maps Feature",
                                style: GilroyFontBlack.bold10(context),
                              ),
                              SizedBox(height: 8.w),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                    width: 20.w,
                                    child: Checkbox(
                                      checkColor:
                                          BaseColors.fontPrimaryLightOrange,
                                      value: isDangerious,
                                      fillColor:
                                          MaterialStateProperty.resolveWith(
                                              getColor),
                                      onChanged: (value) {
                                        setState(() {
                                          isDangerious = value ?? false;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    "Show dangerious locations",
                                    style: GilroyFontBlack.medium10(context),
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: isDangerious,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5.w),
                                    Row(
                                      children: [
                                        SizedBox(width: 40.w),
                                        CircleAvatar(
                                          backgroundColor:
                                              const Color(0xFFFF0000),
                                          radius: 6.w,
                                        ),
                                        SizedBox(width: 8.w),
                                        Text(
                                          "Dangerious Locations",
                                          style:
                                              GilroyFontBlack.medium10(context),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.w),
                                    Row(
                                      children: [
                                        SizedBox(width: 40.w),
                                        CircleAvatar(
                                          backgroundColor:
                                              const Color(0xFF00C920),
                                          radius: 6.w,
                                        ),
                                        SizedBox(width: 8.w),
                                        Text(
                                          "Safe Locations",
                                          style:
                                              GilroyFontBlack.medium10(context),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.w),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 33.w),
                      ],
                    ),
                  ],
                ),
              )
            : Container(),
        isLocation == true
            ? Stack(
                children: [
                  Container(
                    color: Colors.black.withOpacity(.6),
                  ),
                  SafeArea(
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 40.h),
                          Text(
                            "Maps Location",
                            style: GilroyFontBlack.bold30(context).copyWith(
                              color: BaseColors.primaryLightOrange,
                            ),
                          ),
                          Text(
                            "Alert Us",
                            style: GilroyFontBlack.bold18(context).copyWith(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 70.h,
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 45.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 20.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Image.asset(BaseImages.location),
                                SizedBox(height: 20.h),
                                Text(
                                  "Enable your location",
                                  style: GilroyFontBlack.bold24(context),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  "Choose your location to start find the request around you",
                                  style: GilroyFontBlack.regular14(context),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 40.h),
                                PrimaryButton(
                                    onTap: () {
                                      setState(() {
                                        isLocation = false;
                                      });
                                    },
                                    text: "Use my location"),
                                SizedBox(height: 20.h),
                                TouchableOpacityWidget(
                                  onTap: () {
                                    setState(() {
                                      isLocation = false;
                                    });
                                  },
                                  child: Text(
                                    "Skip for now",
                                    style:
                                        GilreyFont.medium14(context).copyWith(
                                      color: const Color(0xFFB8B8B8),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 50.h),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({
    super.key,
    required this.onFakeCall,
    required this.onSOS,
  });

  final Function() onFakeCall;
  final Function() onSOS;

  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                                "Mr Sayid",
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
                          boxShadow: const [
                            BoxShadow(
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
                                  style: GilroyFontBlack.regular16(context)
                                      .copyWith(
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    Text(
                      "Choose a day",
                      style: GilroyFontBlack.bold15(context),
                    ),
                    SizedBox(height: 12.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const DateCard(
                            date: "06",
                            name: "Thu",
                          ),
                          SizedBox(width: 22.w),
                          const DateCard(
                            date: "07",
                            name: "Fri",
                          ),
                          SizedBox(width: 22.w),
                          const DateCard(
                            date: "08",
                            name: "Sat",
                          ),
                          SizedBox(width: 22.w),
                          const DateCard(
                            isActive: true,
                            date: "09",
                            name: "Sun",
                          ),
                          SizedBox(width: 22.w),
                          const DateCard(
                            date: "10",
                            name: "Mon",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 37.h),
                    Text(
                      "Incoming Report",
                      style: GilroyFontBlack.bold15(context),
                    ),
                    SizedBox(height: 17.h),
                    Row(
                      children: [
                        const Expanded(
                          child: IncomingCard(
                            title: "Incoming Report",
                            body: "20 Report",
                            subtitle: "Today",
                          ),
                        ),
                        SizedBox(width: 11.w),
                        const Expanded(
                          child: IncomingCard(
                            title: "Report Completed",
                            body: "8 Report",
                            subtitle: "Today",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      children: [
                        const Expanded(
                          child: IncomingCard(
                            title: "Rest",
                            body: "00:30 min",
                            subtitle: "Avg Waktu 30 min",
                          ),
                        ),
                        SizedBox(width: 11.w),
                        const Expanded(
                          child: IncomingCard(
                            title: "Report Totals",
                            body: "28",
                            subtitle: "Report",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class IncomingCard extends StatelessWidget {
  final String title;
  final String body;
  final String subtitle;

  const IncomingCard({
    super.key,
    required this.title,
    required this.body,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            blurRadius: 128.57,
            color: Colors.black.withOpacity(.04),
            offset: const Offset(0, 64.28),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 20.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.3),
                  color: const Color(0xFF3085FE).withOpacity(.10),
                ),
                child: SvgPicture.asset(BaseSvg.icInside),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Text(
                  title,
                  style: GilroyFontBlack.regular12(context),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            body,
            style: GilroyFontBlack.medium22(context),
          ),
          SizedBox(height: 8.h),
          Text(
            subtitle,
            style: GilroyFontBlack.regular12(context),
          ),
        ],
      ),
    );
  }
}

class DateCard extends StatelessWidget {
  final String date;
  final String name;
  final bool isActive;

  const DateCard({
    super.key,
    required this.date,
    required this.name,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF3085FE) : Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: const Color(0xFFACAFB5).withOpacity(.10),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 18.w,
        vertical: 9.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: GilroyFontBlack.bold16(context)
                .copyWith(color: isActive ? Colors.white : Colors.black),
          ),
          SizedBox(height: 2.h),
          Text(
            name,
            style: GilroyFontBlack.light12(context)
                .copyWith(color: isActive ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}

class ReportTab extends StatelessWidget {
  const ReportTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: BaseColors.fontPrimaryLightOrange,
            child: SafeArea(
              child: Column(
                children: [
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
          SizedBox(height: 53.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Report History",
                  style: GilroyFontBlack.bold15(context),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFF3085FE)),
                                color: const Color(0xFF3085FE).withOpacity(.05),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 20.w,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total\nCalling",
                                    style: GilroyFontBlack.semiBold16(context),
                                  ),
                                  SizedBox(height: 16.h),
                                  Text(
                                    "20",
                                    style: GilroyFontBlack.bold20(context)
                                        .copyWith(
                                            color: const Color(0xFF3085FE)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFFA3D139)),
                                color: const Color(0xFFA3D139).withOpacity(.05),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 20.w,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Calling\nAccepted",
                                    style: GilroyFontBlack.semiBold16(context),
                                  ),
                                  SizedBox(height: 16.h),
                                  Text(
                                    "15",
                                    style: GilroyFontBlack.bold20(context)
                                        .copyWith(
                                            color: const Color(0xFFA3D139)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFF30BEB6)),
                                color: const Color(0xFF30BEB6).withOpacity(.05),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 20.w,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Calling\nPending",
                                    style: GilroyFontBlack.semiBold16(context),
                                  ),
                                  SizedBox(height: 16.h),
                                  Text(
                                    "20",
                                    style: GilroyFontBlack.bold20(context)
                                        .copyWith(
                                            color: const Color(0xFF30BEB6)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFFFF7F74)),
                                color: const Color(0xFFFF7F74).withOpacity(.05),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 20.w,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Calling\nNot Accepted",
                                    style: GilroyFontBlack.semiBold16(context),
                                  ),
                                  SizedBox(height: 16.h),
                                  Text(
                                    "15",
                                    style: GilroyFontBlack.bold20(context)
                                        .copyWith(
                                            color: const Color(0xFFFF7F74)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  "Report History",
                  style: GilroyFontBlack.bold15(context),
                ),
                SizedBox(height: 20.h),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.04),
                        blurRadius: 110,
                        offset: const Offset(0, 55),
                      ),
                    ],
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 19.w, vertical: 15.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Date",
                                style: GilroyFontBlack.regular12(context),
                              ),
                              Text(
                                "Apr 15, 2023 - Apr 18, 2023",
                                style: GilroyFontBlack.semiBold14(context),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 14.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF30BEB6).withOpacity(.05),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "Approved",
                              style:
                                  GilroyFontBlack.regular12(context).copyWith(
                                color: const Color(0xFF30BEB6),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h),
                      const Divider(),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Location",
                                style: GilroyFontBlack.regular12(context),
                              ),
                              Text(
                                "Semarang, Kab. X",
                                style: GilroyFontBlack.semiBold14(context),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 50.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sender",
                                  style: GilroyFontBlack.regular12(context),
                                ),
                                Text(
                                  "Sayid",
                                  style: GilroyFontBlack.semiBold14(context),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.04),
                        blurRadius: 110,
                        offset: const Offset(0, 55),
                      ),
                    ],
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 19.w, vertical: 15.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Date",
                                style: GilroyFontBlack.regular12(context),
                              ),
                              Text(
                                "Apr 15, 2023 - Apr 18, 2023",
                                style: GilroyFontBlack.semiBold14(context),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 14.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF30BEB6).withOpacity(.05),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "Approved",
                              style:
                                  GilroyFontBlack.regular12(context).copyWith(
                                color: const Color(0xFF30BEB6),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h),
                      const Divider(),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Location",
                                style: GilroyFontBlack.regular12(context),
                              ),
                              Text(
                                "Semarang, Kab. X",
                                style: GilroyFontBlack.semiBold14(context),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 50.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sender",
                                  style: GilroyFontBlack.regular12(context),
                                ),
                                Text(
                                  "Dani",
                                  style: GilroyFontBlack.semiBold14(context),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60.h),
              ],
            ),
          ),
        ],
      ),
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
                  Navigator.of(context)
                      .pushReplacementNamed(ROUTER.login, arguments: true);
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
