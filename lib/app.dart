import 'package:alertus/core/constants/font.dart';
import 'package:alertus/core/constants/router.dart';
import 'package:alertus/core/resources/colors.dart';
import 'package:alertus/core/utils/scroll_behaviour_utils.dart';
import 'package:alertus/screens/add_contact_screen.dart';
import 'package:alertus/screens/face_recognition_screen.dart';
import 'package:alertus/screens/home_police_screen.dart';
import 'package:alertus/screens/home_screen.dart';
import 'package:alertus/screens/join_us_police_screen.dart';
import 'package:alertus/screens/join_us_public_screen.dart';
import 'package:alertus/screens/login_screen.dart';
import 'package:alertus/screens/register_screen.dart';
import 'package:alertus/screens/role_screen.dart';
import 'package:alertus/screens/setting_screen.dart';
import 'package:alertus/screens/splash_screen.dart';
import 'package:alertus/screens/track_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Alert Us',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: BaseColors.primaryLightOrange),
            fontFamily: BaseFonts.gilroy,
          ),
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: const ScrollBehaviourUtils(),
              child: child ?? Container(),
            );
          },
          home: const SplashScreen(),
          routes: {
            ROUTER.role: (context) => const RoleScreen(),
            ROUTER.login: (context) => const LoginScreen(),
            ROUTER.register: (context) => const RegisterScreen(),
            ROUTER.home: (context) => const HomeScreen(),
            ROUTER.home_police: (context) => const HomePoliceScreen(),
            ROUTER.setting: (context) => const SettingScreen(),
            ROUTER.addContact: (context) => const AddContactScreen(),
            ROUTER.tracker: (context) => const TrackScreen(),
            ROUTER.joinUsPublic: (context) => const JoinUsPublicScreen(),
            ROUTER.joinUsPolice: (context) => const JoinUsPoliceScreen(),
            ROUTER.faceRecognition: (context) => const FaceRecognitionScreen(),
          },
        );
      },
    );
  }
}
