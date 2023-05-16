import 'dart:async';

import 'package:app_monitoring/color.dart';
import 'package:app_monitoring/page/login/loginpage.dart';
import 'package:app_monitoring/page/user/home/homepage.dart';
import 'package:app_monitoring/widget/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => wrapperClass())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                child: Center(
              child: Image.asset(
                "asset/image/bsi.png",
                height: MediaQuery.of(context).size.height / 5,
              ),
            )),
            Positioned(
                bottom: -10,
                right: -10,
                child: Image.asset(
                  "asset/image/bottombackround.png",
                  width: MediaQuery.of(context).size.width / 2,
                )),
            Positioned(
                top: -10,
                left: -10,
                child: Image.asset(
                  "asset/image/topbackground.png",
                  width: MediaQuery.of(context).size.width / 2,
                )),
            Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.8,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("asset/image/bsi.png",
                          width: MediaQuery.of(context).size.width / 9),
                      Image.asset("asset/image/bank_indonesia.png",
                          width: MediaQuery.of(context).size.width / 10),
                      Image.asset("asset/image/ojk.png",
                          width: MediaQuery.of(context).size.width / 10)
                    ],
                  ),
                )),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 5,
              left: MediaQuery.of(context).size.width / 2.3,
              child: Container(
                child: CircularProgressIndicator(
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
