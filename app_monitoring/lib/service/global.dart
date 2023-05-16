import 'package:app_monitoring/color.dart';
import 'package:flutter/material.dart';

const String baseUrl = "http://10.0.2.2:8000/api";

const Map<String, String> headers = {"Content-Type": "application/json"};

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: AppColor.BlueGreen,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}
