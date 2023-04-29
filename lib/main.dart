import 'package:store_app_v1/core.dart';
import 'package:store_app_v1/state_util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.navigatorKey,
      themeMode: ThemeMode.dark,
      home: const LoginView(),
    );
  }
}
