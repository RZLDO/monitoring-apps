import 'package:app_monitoring/color.dart';
import 'package:app_monitoring/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BSI monitoring System',
      theme: ThemeData(
          fontFamily: 'Roboto',
          scaffoldBackgroundColor: AppColor.BackgroundColor,
          iconTheme: IconThemeData(
            color: AppColor.BlueGreen,
          )),
      home: SplashScreen(),
    );
  }
}
