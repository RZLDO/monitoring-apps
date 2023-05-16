import 'dart:convert';

import 'package:app_monitoring/color.dart';
import 'package:app_monitoring/page/login/custombutton.dart';
import 'package:app_monitoring/service/auth_service.dart';
import 'package:app_monitoring/service/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class InputData extends StatefulWidget {
  const InputData({super.key});

  @override
  State<InputData> createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  TextEditingController Task_name = new TextEditingController();
  TextEditingController Task_Detail = new TextEditingController();
  TextEditingController id = new TextEditingController();

  Ontap() async {
    if (id != null &&
        Task_name.text.isNotEmpty &&
        Task_Detail.text.isNotEmpty) {
      int idData = int.parse(id.text);
      http.Response response =
          await AuthService.DataTask(idData, Task_name.text, Task_Detail.text);
      Map map = jsonDecode(response.body);
      if (response.statusCode == 200) {
        errorSnackBar(context, "Data Tugas Karyawan berhasil di upload");
      } else {
        errorSnackBar(context, map.values.first.toString());
      }
    } else {
      errorSnackBar(context, 'isi semua field yang di perlukan');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColor.BlueGreen),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "Input Data Tugas Karyawan",
          style: TextStyle(color: AppColor.BlueGreen),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Column(children: [
          TFid(id: id),
          SizedBox(
            height: 20,
          ),
          TFusername(username: Task_name),
          SizedBox(
            height: 20,
          ),
          TFnama(Nama: Task_Detail),
          SizedBox(
            height: 20,
          ),
          Spacer(),
          CustomButton(
            text: "Input",
            ontap: (() {
              Ontap();
            }),
            widht: MediaQuery.of(context).size.width * 0.8,
          ),
        ]),
      ),
    );
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
    return TextField(
        controller: username,
        decoration: InputDecoration(
            label: Text("Nama Task"),
            hintText: "Nama Task",
            hintStyle: TextStyle(color: AppColor.BlueGreen),
            focusedBorder: new OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.BlueGreen),
                borderRadius: BorderRadius.circular(15)),
            enabledBorder: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColor.BlueGreen))));
  }
}

class TFpass extends StatelessWidget {
  const TFpass({
    Key? key,
    required this.password,
  }) : super(key: key);

  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: password,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            label: Text("password"),
            hintText: "Password",
            hintStyle: TextStyle(color: AppColor.BlueGreen),
            focusedBorder: new OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.BlueGreen),
                borderRadius: BorderRadius.circular(15)),
            enabledBorder: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColor.BlueGreen))));
  }
}

class TFnama extends StatelessWidget {
  const TFnama({
    Key? key,
    required this.Nama,
  }) : super(key: key);

  final TextEditingController Nama;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: Nama,
        decoration: InputDecoration(
            label: Text("Detail Task"),
            hintText: "Detail Task",
            hintStyle: TextStyle(color: AppColor.BlueGreen),
            focusedBorder: new OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.BlueGreen),
                borderRadius: BorderRadius.circular(15)),
            enabledBorder: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColor.BlueGreen))));
  }
}

class TFid extends StatelessWidget {
  const TFid({
    Key? key,
    required this.id,
  }) : super(key: key);

  final TextEditingController id;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: id,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            label: Text("id"),
            labelStyle: TextStyle(backgroundColor: Colors.transparent),
            hintText: "id",
            hintStyle: TextStyle(color: AppColor.BlueGreen),
            focusedBorder: new OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.BlueGreen),
                borderRadius: BorderRadius.circular(15)),
            enabledBorder: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColor.BlueGreen))));
  }
}
