import 'package:app_monitoring/page/setting/widget.dart';
import 'package:app_monitoring/widget/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListMenu extends StatelessWidget {
  String? text;
  final Function() ontap;
  ListMenu({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
          onTap: ontap,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextTask(text: text.toString()),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          )),
    );
  }
}
