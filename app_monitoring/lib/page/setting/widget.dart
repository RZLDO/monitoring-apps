import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextTask extends StatelessWidget {
  String text;
  double? size;
  TextTask({super.key, required this.text, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.black54,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
          fontSize: size == null ? 14 : size),
    );
  }
}
