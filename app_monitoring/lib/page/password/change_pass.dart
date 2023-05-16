import 'dart:convert';
import 'package:app_monitoring/color.dart';
import 'package:app_monitoring/page/login/custombutton.dart';
import 'package:app_monitoring/page/login/loginpage.dart';
import 'package:app_monitoring/service/auth_service.dart';
import 'package:app_monitoring/service/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController _oldPassword = new TextEditingController();
  TextEditingController _newPassword = new TextEditingController();
  TextEditingController _ConfirmPassword = new TextEditingController();
  final storage = new FlutterSecureStorage();
  final _formKey = GlobalKey<FormState>();

  Future ChangePassword() async {
    var validate = _formKey.currentState!.validate();
    String? token = await storage.read(key: "token");
    if (validate == true) {
      if (token != null) {
        var url = 'http://10.0.2.2:8000/api/user/resetPassword';
        Map data = {
          "old_password": _oldPassword.text,
          "new_password": _newPassword.text,
          "confirm_password": _ConfirmPassword.text
        };
        var body = jsonEncode(data);
        var urlParse = Uri.parse(url);
        http.Response response = await http.put(urlParse,
            headers: {
              "Content-Type": "application/json",
              "Authorization": 'Bearer $token'
            },
            body: body);
        Map ResponseMap = json.decode(response.body);
        if (response.statusCode == 200) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
          errorSnackBar(context, 'password update succesfully');
        } else {
          errorSnackBar(context, ResponseMap.values.first[0]);
        }
      }
    } else {
      errorSnackBar(context, 'field must be filled');
    }
  }

  @override
  void dispose() {
    _oldPassword.dispose();
    _newPassword.dispose();
    _ConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.BackgroundColor,
        iconTheme: IconThemeData(color: AppColor.BlueGreen),
        elevation: 0,
        leading: GestureDetector(
            onTap: (() {
              Navigator.pop(context);
            }),
            child: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormField(
                    controller: _oldPassword,
                    decoration: new InputDecoration(
                      hintText: 'Old Password',
                      hintStyle: TextStyle(color: AppColor.BlueGreen),
                      focusedBorder: new UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.BlueGreen),
                      ),
                      enabledBorder: new UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.BlueGreen)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _newPassword,
                    decoration: new InputDecoration(
                      hintText: 'New Password',
                      hintStyle: TextStyle(color: AppColor.BlueGreen),
                      focusedBorder: new UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.BlueGreen),
                      ),
                      enabledBorder: new UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.BlueGreen)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _ConfirmPassword,
                    decoration: new InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: AppColor.BlueGreen),
                      focusedBorder: new UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.BlueGreen),
                      ),
                      enabledBorder: new UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.BlueGreen)),
                    ),
                    validator: ((value) {
                      if (value != null && value != _newPassword.text) {
                        return 'Password Tidak Cocok ';
                      }
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
                text: 'Confirm',
                ontap: (() {
                  ChangePassword();
                }))
          ],
        ),
      ),
    );
  }
}
