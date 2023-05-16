import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../color.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final IconData icon;
  var controller = TextEditingController();
  final bool istrue;
  CustomTextField({
    super.key,
    required this.text,
    required this.icon,
    required this.istrue,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        obscureText: istrue,
        decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(color: AppColor.BlueGreen),
            prefixIcon: Icon(
              icon,
              color: AppColor.BlueGreen,
            ),
            focusedBorder: new OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.BlueGreen),
                borderRadius: BorderRadius.circular(15)),
            enabledBorder: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColor.BlueGreen))));
  }
}
