import 'dart:convert';

import 'package:app_monitoring/service/global.dart';
import 'package:http/http.dart' as http;

class task {
  int id;
  int id_karyawan;
  String Task_name;
  String Task_Detail;
  String Task_status;

  task({
    required this.id,
    required this.id_karyawan,
    required this.Task_name,
    required this.Task_Detail,
    required this.Task_status,
  });

  factory task.fromJson(Map<dynamic, dynamic> json) {
    return task(
      id: json['id'],
      id_karyawan: json['id_karyawan'],
      Task_name: json['Task_name'],
      Task_Detail: json['Task_Detail'],
      Task_status: json['Task_status'],
    );
  }
}
