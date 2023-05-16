import 'dart:convert';

import 'package:app_monitoring/color.dart';
import 'package:app_monitoring/models/usermodel.dart';
import 'package:app_monitoring/page/user/home/homepage.dart';
import 'package:app_monitoring/service/auth_service.dart';
import 'package:app_monitoring/service/global.dart';
import 'package:app_monitoring/widget/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class RegisterAccount extends StatefulWidget {
  const RegisterAccount({super.key});

  @override
  State<RegisterAccount> createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
  TextEditingController nama = TextEditingController();
  TextEditingController nip = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    nama.dispose();
    nip.dispose();
    email.dispose();
    password.dispose();
    repassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColor.BackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: AppColor.BlueGreen,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Container(
            height: 20,
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "asset/image/ojk.png",
                  height: 50,
                ),
                Image.asset(
                  "asset/image/bsilong.png",
                  height: 50,
                  width: 50,
                ),
                Image.asset(
                  "asset/image/bank_indonesia.png",
                  width: 50,
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 50,
            ),
            text(textdata: "Assalamu'alaikum", size: 28),
            text(textdata: "Menu update Data Karyawan", size: 14),
            SizedBox(
              height: 10,
            ),
            Form(
                key: formkey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TFnama(nama: nama),
                    SizedBox(
                      height: 20,
                    ),
                    TFnip(nip: nip),
                    SizedBox(
                      height: 20,
                    ),
                    TFusername(username: email),
                    SizedBox(
                      height: 20,
                    ),
                    TFpassword(password: password),
                    SizedBox(
                      height: 20,
                    ),
                    TFrepass(
                      repassword: repassword,
                      password: password,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Register",
                          style: TextStyle(
                              color: AppColor.BlueGreen,
                              fontFamily: 'Oswald',
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.BlueGreen),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(25),
                              onTap: () async {
                                var validate = formkey.currentState!.validate();
                                if (validate == true) {
                                  http.Response response =
                                      await AuthService.register(nama.text,
                                          nip.text, email.text, password.text);
                                  Map responseMap = jsonDecode(response.body);
                                  if (response.statusCode == 200) {
                                    errorSnackBar(context,
                                        'Data Karyawan Berhasil di Update');
                                  } else {
                                    errorSnackBar(
                                        context, responseMap.values.first[0]);
                                  }
                                }
                              },
                              child: Center(
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ))
          ]),
        ),
      ),
    ));
  }
}

class TFusername extends StatelessWidget {
  const TFusername({
    Key? key,
    required this.username,
  }) : super(key: key);

  final TextEditingController username;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: username,
      decoration: new InputDecoration(
          hintText: 'Email',
          hintStyle: TextStyle(color: AppColor.BlueGreen),
          focusedBorder: new UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.BlueGreen),
          ),
          enabledBorder: new UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.BlueGreen))),
      validator: (value) {
        if (value!.isEmpty) {
          return 'field ini tidak boleh kosong';
        }
      },
    );
  }
}

class TFrepass extends StatelessWidget {
  const TFrepass({
    Key? key,
    required this.repassword,
    required this.password,
  }) : super(key: key);

  final TextEditingController repassword;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: repassword,
      obscureText: true,
      decoration: new InputDecoration(
          hintText: 'Re-password',
          hintStyle: TextStyle(color: AppColor.BlueGreen),
          focusedBorder: new UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.BlueGreen),
          ),
          enabledBorder: new UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.BlueGreen))),
      validator: ((value) {
        if (value != null && value != password.text) {
          return 'password tidak cocok';
        }
      }),
    );
  }
}

class TFpassword extends StatelessWidget {
  const TFpassword({
    Key? key,
    required this.password,
  }) : super(key: key);

  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      controller: password,
      decoration: new InputDecoration(
          hintText: 'password',
          hintStyle: TextStyle(color: AppColor.BlueGreen),
          focusedBorder: new UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.BlueGreen),
          ),
          enabledBorder: new UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.BlueGreen))),
      validator: (value) {
        if (value != null && value.length < 8) {
          return 'password minimal 8 karakter';
        }
      },
    );
  }
}

class TFnip extends StatelessWidget {
  const TFnip({
    Key? key,
    required this.nip,
  }) : super(key: key);

  final TextEditingController nip;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: nip,
      decoration: new InputDecoration(
          hintText: 'NIP',
          hintStyle: TextStyle(color: AppColor.BlueGreen),
          focusedBorder: new UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.BlueGreen),
          ),
          enabledBorder: new UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.BlueGreen))),
      validator: (value) {
        if (value != null && value.length < 5) {
          return 'Masukkan NIP yang benar';
        }
      },
    );
  }
}

class TFnama extends StatelessWidget {
  const TFnama({
    Key? key,
    required this.nama,
  }) : super(key: key);

  final TextEditingController nama;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nama,
      decoration: new InputDecoration(
          hintText: 'Nama',
          hintStyle: TextStyle(color: AppColor.BlueGreen),
          focusedBorder: new UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.BlueGreen),
          ),
          enabledBorder: new UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.BlueGreen))),
      validator: (value) {
        if (value!.isEmpty) {
          return 'field ini tidak boleh kosong';
        } else {
          return null;
        }
      },
    );
  }
}
