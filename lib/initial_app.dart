import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InitialApp {
  static Future<void> execute() async {
    _initWidget();
  }

  static void _initWidget() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));

    WidgetsFlutterBinding.ensureInitialized();
  }
}
