import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TaskList extends StatelessWidget {
  final String text;
  final String employe;
  final IconData icon;
  final Function() ontap;
  const TaskList(
      {super.key,
      required this.text,
      required this.employe,
      required this.icon,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        child: InkWell(
          child: Column(
            children: [
              Row(
                children: [
                  Text(text),
                  IconButton(onPressed: ontap, icon: Icon(icon))
                ],
              ),
              Text(employe)
            ],
          ),
        ),
      ),
    );
  }
}
