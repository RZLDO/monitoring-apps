import 'package:app_monitoring/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double? size;
  const TextWidget({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: AppColor.BlueGreen,
          fontSize: size,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700),
    );
  }
}
