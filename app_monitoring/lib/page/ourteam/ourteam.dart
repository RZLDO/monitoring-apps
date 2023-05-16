import 'package:app_monitoring/color.dart';
import 'package:app_monitoring/page/ourteam/avatar.dart';
import 'package:app_monitoring/widget/drawercustom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OurTeam extends StatefulWidget {
  const OurTeam({super.key});

  @override
  State<OurTeam> createState() => _OurTeamState();
}

class _OurTeamState extends State<OurTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.BlueGreen),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new)),
        backgroundColor: AppColor.BackgroundColor,
        elevation: 0,
        actions: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 6,
          ),
        ],
      ),
      backgroundColor: AppColor.BackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              AvatarWidget(
                  image: "asset/image/rizaldo.JPG",
                  nama: "Rizaldo Setiawan",
                  jabatan: "Flutter Dev"),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
