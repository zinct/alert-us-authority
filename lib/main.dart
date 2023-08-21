import 'package:alertus/app.dart';
import 'package:alertus/initial_app.dart';
import 'package:flutter/material.dart';

void main() async {
  await InitialApp.execute();

  runApp(const MyApp());
}
