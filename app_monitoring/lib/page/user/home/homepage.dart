import 'dart:convert';

import 'package:app_monitoring/color.dart';
import 'package:app_monitoring/data/data.dart';
import 'package:app_monitoring/page/task/taskkamu.dart';
import 'package:app_monitoring/page/user/home/widget/listtask.dart';
import 'package:app_monitoring/page/user/task/detailtask.dart';
import 'package:app_monitoring/page/user/task/task.dart';
import 'package:app_monitoring/service/auth_service.dart';
import 'package:app_monitoring/service/models/task.dart';
import 'package:app_monitoring/widget/bottonnavbar.dart';
import 'package:app_monitoring/widget/carouselbuilder.dart';
import 'package:app_monitoring/widget/drawercustom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../service/global.dart';
import '../../../service/task_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../login/loginpage.dart';
import '../../ourteam/ourteam.dart';
import '../../setting/setting.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<task> taskList = [];
  final Storage = new FlutterSecureStorage();

  Future<List<task>> getTask() async {
    var URL = 'http://10.0.2.2:8000/api/user/getTask';
    String? token = await Storage.read(key: "token");
    if (token != null) {
      final response = await http.get(Uri.parse(URL), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        for (Map i in data) {
          task Task = task(
              id: i['id'],
              id_karyawan: i['id_karyawan'],
              Task_name: i['Task_name'],
              Task_Detail: i['Task_Detail'],
              Task_status: i['Task_status']);
          taskList.add(Task);
        }
      }
    }
    return taskList;
  }

  @override
  void initState() {
    // TODO: implement initStat
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.BlueGreen),
        backgroundColor: Colors.white,
        actions: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 6,
          ),
          Image.asset(
            "asset/image/bsilong.png",
            width: 70,
            height: 70,
          ),
          Spacer(),
          IconButton(
              onPressed: (() {}), icon: Icon(Icons.support_agent_outlined)),
          IconButton(onPressed: (() {}), icon: Icon(Icons.notifications))
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              "asset/image/bsilong.png",
              width: 200,
              height: MediaQuery.of(context).size.height / 7,
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.dashboard,
                color: AppColor.BlueGreen,
              ),
              title: Text("Dasboard"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => HomePage())));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.task,
                color: AppColor.BlueGreen,
              ),
              title: Text("Task Kamu"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => TaskKamu())));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: AppColor.BlueGreen,
              ),
              title: Text("Setting"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => settingApps()));
              },
            ),
            ListTile(
              onTap: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => OurTeam())));
              }),
              leading: Icon(
                Icons.group,
                color: AppColor.BlueGreen,
              ),
              title: Text("Team Kami"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              leading: Icon(
                Icons.logout,
                color: AppColor.BlueGreen,
              ),
              title: Text("Log Out"),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              CarouselBuilder(),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 420,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Expanded(
                    child: FutureBuilder(
                      future: getTask(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<task>> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: taskList.length,
                              itemBuilder: ((context, index) {
                                return Card(
                                    elevation: 4,
                                    color: Colors.transparent,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.13,
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
                                                  builder: ((context) =>
                                                      Detailtask(
                                                        id: snapshot
                                                            .data![index].id,
                                                      ))));
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
