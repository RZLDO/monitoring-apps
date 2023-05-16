import 'dart:convert';
import 'package:app_monitoring/color.dart';
import 'package:app_monitoring/dataclass.dart';
import 'package:app_monitoring/page/admin/admi.dart';
import 'package:app_monitoring/page/register/register.dart';
import 'package:app_monitoring/page/user/home/homepage.dart';
import 'package:app_monitoring/service/auth_service.dart';
import 'package:app_monitoring/service/global.dart';
import 'package:app_monitoring/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final storage = new FlutterSecureStorage();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  onTapAdmin() async {
    bool Validemail = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email.text);
    if (Validemail) {
      if (email.text.isNotEmpty && password.text.isNotEmpty) {
        http.Response response =
            await AuthService.admin(email.text, password.text);
        Map responseMap = json.decode(response.body);
        if (response.statusCode == 200) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const HomePageAdmin()));
        } else {
          onTapLogin();
        }
      } else {
        errorSnackBar(context, 'enter all required fields');
      }
    } else {
      errorSnackBar(context, 'Enter Valid Email');
    }
  }

  onTapLogin() async {
    bool ValidEmail = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email.text);
    if (ValidEmail) {
      if (email.text.isNotEmpty && password.text.isNotEmpty) {
        http.Response response =
            await AuthService.login(email.text, password.text);
        Map responseMap = json.decode(response.body);
        var data = json.decode(response.body);
        await storage.write(key: "token", value: data["token"]);
        if (response.statusCode == 200) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => HomePage()));
          errorSnackBar(context, 'User Login Succesfully');
        } else {
          errorSnackBar(context, responseMap.values.first);
        }
      } else {
        errorSnackBar(context, 'enter all required fields');
      }
    } else {
      errorSnackBar(context, 'Enter Valid Email');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.BackgroundColor,
      body: Container(
        child: Stack(
          children: [
            //bakcground
            Positioned(
                top: -5,
                left: -5,
                child: Image.asset(
                  "asset/image/topbackground.png",
                  width: MediaQuery.of(context).size.width * 0.45,
                )),
            Positioned(
                bottom: -5,
                right: -5,
                child: Image.asset(
                  "asset/image/bottombackround.png",
                  width: MediaQuery.of(context).size.width * 0.45,
                )),
            Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 200,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("asset/image/ojk.png"),
                      Image.asset(
                        "asset/image/bsilong.png",
                        width: 50,
                      ),
                      Image.asset(
                        "asset/image/bank_indonesia.png",
                        width: 50,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                )),
            //login form
            Positioned(
                child: Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.45,
                padding:
                    EdgeInsets.only(top: 30, left: 50, right: 50, bottom: 20),
                decoration: BoxDecoration(
                  color: AppColor.BackgroundColorContainer,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1,
                        offset: Offset(2, 3),
                        color: Colors.grey.withOpacity(0.2))
                  ],
                ),
                child: Column(children: [
                  text(textdata: "Assalamu'alaikum", size: 24),
                  text(textdata: "Silahkan login terlebih dahulu", size: 16),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: email,
                    decoration: new InputDecoration(
                        hintText: 'email',
                        hintStyle: new TextStyle(
                            fontStyle: FontStyle.italic,
                            color: AppColor.BlueGreen),
                        prefixIcon: Icon(
                          Icons.account_circle_outlined,
                          color: AppColor.BlueGreen,
                        ),
                        enabledBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.BlueGreen)),
                        focusedBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.BlueGreen))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: password,
                    obscureText: true,
                    decoration: new InputDecoration(
                        hintText: 'password',
                        hintStyle: new TextStyle(
                            color: AppColor.BlueGreen,
                            fontStyle: FontStyle.italic),
                        prefixIcon: Icon(
                          Icons.account_circle_outlined,
                          color: AppColor.BlueGreen,
                        ),
                        enabledBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.BlueGreen)),
                        focusedBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.BlueGreen))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 50,
                      decoration: BoxDecoration(
                          color: AppColor.orangeColor.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          child: InkWell(
                              splashColor: AppColor.orangeColor,
                              onTap: (() {
                                onTapAdmin();
                              }),
                              child: Center(
                                  child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Oswald',
                                    fontSize: 20),
                              )))))
                ]),
              ),
            )),
            //login button
          ],
        ),
      ),
    ));
  }
}
