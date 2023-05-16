import 'package:app_monitoring/color.dart';
import 'package:app_monitoring/widget/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AvatarWidget extends StatelessWidget {
  final String image;
  final String nama;
  final String jabatan;

  const AvatarWidget(
      {super.key,
      required this.image,
      required this.nama,
      required this.jabatan});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(children: [
          CircleAvatar(
            radius: 105,
            backgroundColor: AppColor.BlueGreen,
            child: ClipOval(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: 200,
                height: 200,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          text(textdata: nama, size: 24),
          SizedBox(
            height: 5,
          ),
          text(textdata: jabatan, size: 16),
        ]),
      ),
    );
  }
}
