import 'package:alertus/core/constants/router.dart';
import 'package:alertus/core/resources/images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _handleChangeScreen();
  }

  void _handleChangeScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    if (context.mounted) {
      Navigator.of(context).pushReplacementNamed(ROUTER.role);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Image.asset(
          BaseImages.commonLogo,
        ),
      )),
    );
  }
}
