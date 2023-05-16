import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../color.dart';

class TextTittle extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  const TextTittle({super.key, required this.text, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: 'Oswald',
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class subTitle extends StatelessWidget {
  String text;
  double? size;
  Color? color;

  subTitle({required this.text, this.size, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color == null ? Colors.black45 : color,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: size,
      ),
    );
  }
}
