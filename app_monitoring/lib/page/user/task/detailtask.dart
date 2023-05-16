import 'dart:convert';
import 'dart:io';

import 'package:app_monitoring/color.dart';
import 'package:app_monitoring/page/login/custombutton.dart';
import 'package:app_monitoring/page/user/task/texttitle.dart';
import 'package:app_monitoring/service/global.dart';
import 'package:app_monitoring/service/models/task.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class Detailtask extends StatefulWidget {
  int id;
  Detailtask({super.key, required this.id});

  @override
  State<Detailtask> createState() => _DetailtaskState();
}

class _DetailtaskState extends State<Detailtask> {
  List<task> TaskList = [];

  PlatformFile? file;
  Future<task> getDatabyId(int id) async {
    var response =
        await http.get(Uri.parse(baseUrl + '/getTask/$id/getTaskByid'));
    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      return task.fromJson(jsonDecode(response.body));
    } else {
      return task.fromJson(jsonDecode(response.body));
    }
  }

  Getfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path.toString());
      return file;
    } else {
      return;
    }
  }

  @override
  void initState() {
    getDatabyId(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1.5,
          iconTheme: IconThemeData(color: AppColor.BlueGreen),
          leading: IconButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              icon: Icon(Icons.arrow_back_ios)),
          title: TextTittle(
            text: "Detail Task",
            color: AppColor.BlueGreen,
          ),
          actions: [
            IconButton(onPressed: (() {}), icon: Icon(Icons.more_vert))
          ],
        ),
        body: FutureBuilder(
            future: getDatabyId(widget.id),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextTittle(
                              text: "Task Name",
                              color: AppColor.BlueGreen,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            subTitle(
                              text: snapshot.data!.Task_name.toString(),
                              size: 14,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextTittle(
                              text: "Task Detail",
                              color: AppColor.BlueGreen,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            subTitle(
                              text: snapshot.data!.Task_Detail.toString(),
                              size: 14,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextTittle(
                              text: "Task Status",
                              color: AppColor.BlueGreen,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            subTitle(text: snapshot.data!.Task_status),
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: CustomButton(
                                  text: "Upload",
                                  ontap: (() async {
                                    Getfile();
                                  }),
                                  widht: 100,
                                  height: 40,
                                  size: 16,
                                )),
                          ],
                        ),
                      ),
                      CustomButton(
                        text: "Submit",
                        ontap: (() {}),
                        widht: MediaQuery.of(context).size.width - 100,
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColor.BlueGreen,
                  ),
                );
              }
            })));
  }
}
