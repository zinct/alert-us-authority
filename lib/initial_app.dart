import 'package:flutter/material.dart';

class InitialApp {
  static Future<void> execute() async {
    _initWidget();
  }

  static void _initWidget() {
    WidgetsFlutterBinding.ensureInitialized();
  }
}
