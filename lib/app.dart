import 'package:alertus/core/constants/font.dart';
import 'package:alertus/core/constants/router.dart';
import 'package:alertus/screens/login_screen.dart';
import 'package:alertus/screens/register_screen.dart';
import 'package:alertus/screens/role_screen.dart';
import 'package:alertus/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return MaterialApp(
        title: 'Alert Us',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: BaseFonts.gilroy,
        ),
        home: const SplashScreen(),
        routes: {
          ROUTER.role: (context) => const RoleScreen(),
          ROUTER.login: (context) => const LoginScreen(),
          ROUTER.register: (context) => const RegisterScreen(),
        },
      );
    });
  }
}
