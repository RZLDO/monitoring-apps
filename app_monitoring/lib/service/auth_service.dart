import 'dart:convert';
import 'package:app_monitoring/service/global.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final storage = new FlutterSecureStorage();

  static Future<http.Response> register(
      String name, String NIP, String email, String password) async {
    Map data = {"name": name, "NIP": NIP, "email": email, "password": password};

    var body = json.encode(data);
    var url = Uri.parse(baseUrl + '/register');
    http.Response response = await http.post(url, headers: headers, body: body);

    print(response.body);
    return response;
  }

  static Future<http.Response> login(String email, String password) async {
    Map data = {"email": email, "password": password};

    var body = json.encode(data);
    var url = Uri.parse(baseUrl + '/login');
    http.Response response = await http.post(url, headers: headers, body: body);
    print(response.body);
    return response;
  }

  static Future<http.Response> admin(String email, String password) async {
    Map data = {"email": email, "password": password};

    var body = json.encode(data);
    var url = Uri.parse(baseUrl + '/AdminLogin');
    http.Response response = await http.post(url, headers: headers, body: body);

    print(response.body);
    return response;
  }

  static Future<http.Response> DataTask(
      int id_karyawan, String Task_name, String Task_Detail) async {
    Map data = {
      "id_karyawan": id_karyawan,
      "Task_name": Task_name,
      "Task_Detail": Task_Detail
    };

    var body = json.encode(data);
    var url = Uri.parse(baseUrl + '/store');
    var response = await http.post(url, headers: headers, body: body);
    return response;
  }

  // static void storeToken(String token) async {
  //   await storage.write(key: "token", value: token);
  // }
}
