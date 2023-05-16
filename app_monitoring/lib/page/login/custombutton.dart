import 'package:app_monitoring/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() ontap;
  final double? widht;
  double? size;
  double? height;
  CustomButton(
      {super.key,
      this.height,
      required this.text,
      required this.ontap,
      this.widht = 200,
      this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widht,
      height: height == null ? 50 : height,
      decoration: BoxDecoration(
          color: AppColor.orangeColor, borderRadius: BorderRadius.circular(15)),
      child: Material(
          borderRadius: BorderRadius.circular(15),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: ontap,
            splashColor: AppColor.BlueGreen,
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: size == null ? 20 : size),
            )),
          )),
    );
  }
}
