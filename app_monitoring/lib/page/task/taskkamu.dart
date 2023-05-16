import 'dart:convert';

import 'package:app_monitoring/color.dart';
import 'package:app_monitoring/data/data.dart';
import 'package:app_monitoring/service/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

import '../user/task/detailtask.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TaskKamu extends StatefulWidget {
  const TaskKamu({super.key});

  @override
  State<TaskKamu> createState() => _TaskKamuState();
}

class _TaskKamuState extends State<TaskKamu> {
  List<task> TaskMethod = [];
  final storage = new FlutterSecureStorage();
  Future<List<task>> getTask() async {
    var URL = 'http://10.0.2.2:8000/api/user/getTask';
    String? token = await storage.read(key: "token");
    final response = await http.get(Uri.parse(URL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var data = json.decode(response.body);
    if (token != null) if (response.statusCode == 200) {
      for (Map i in data) {
        task Task = task(
            id: i['id'],
            id_karyawan: i['id_karyawan'],
            Task_name: i['Task_name'],
            Task_Detail: i['Task_Detail'],
            Task_status: i['Task_status']);
        TaskMethod.add(Task);
      }
    }
    return TaskMethod;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: IconThemeData(
            color: AppColor.BlueGreen,
          ),
          leading: GestureDetector(
              onTap: (() => {Navigator.pop(context)}),
              child: Icon(Icons.arrow_back_ios_new)),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: FutureBuilder(
            future: getTask(),
            builder:
                (BuildContext context, AsyncSnapshot<List<task>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: TaskMethod.length,
                    itemBuilder: ((context, index) {
                      return Card(
                          elevation: 4,
                          color: Colors.transparent,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.13,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "asset/image/task_background.jpg"),
                                    fit: BoxFit.cover,
                                    alignment: Alignment.centerLeft)),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => Detailtask(
                                              id: snapshot.data![index].id,
                                            ))));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    snapshot.data![index].Task_name,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 24,
                                        fontFamily: 'Oswald'),
                                  ),
                                  Text(
                                    "Tap to detail",
                                    style: TextStyle(
                                        color: AppColor.orangeColor,
                                        fontSize: 10),
                                  )
                                ],
                              ),
                            ),
                          ));
                      ;
                    }));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}
