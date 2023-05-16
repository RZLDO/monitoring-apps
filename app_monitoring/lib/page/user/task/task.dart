import 'dart:convert';

import '../../../service/models/task.dart';
import 'package:http/http.dart' as http;

class Repository {
  List<task> taskList = [];
  Future<dynamic> getTask() async {
    var URL = 'http://10.0.2.2:8000/api/getTask';
    final response = await http.get(Uri.parse(URL));
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
      return taskList;
    } else {
      return taskList;
    }
  }
}
