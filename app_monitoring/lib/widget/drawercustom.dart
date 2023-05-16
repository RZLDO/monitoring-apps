import 'package:app_monitoring/color.dart';
import 'package:app_monitoring/dataclass.dart';
import 'package:app_monitoring/page/admin/admi.dart';
import 'package:app_monitoring/page/login/loginpage.dart';
import 'package:app_monitoring/page/ourteam/ourteam.dart';
import 'package:app_monitoring/page/setting/setting.dart';
import 'package:app_monitoring/page/user/home/homepage.dart';
import 'package:app_monitoring/page/user/task/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../page/task/taskkamu.dart';
import '../service/models/task.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Image.asset(
            "asset/image/bsilong.png",
            width: 200,
            height: MediaQuery.of(context).size.height / 7,
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.dashboard,
              color: AppColor.BlueGreen,
            ),
            title: Text("Dasboard"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.task,
              color: AppColor.BlueGreen,
            ),
            title: Text("Task Kamu"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: AppColor.BlueGreen,
            ),
            title: Text("Setting"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => settingApps()));
            },
          ),
          ListTile(
            onTap: (() {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => OurTeam())));
            }),
            leading: Icon(
              Icons.group,
              color: AppColor.BlueGreen,
            ),
            title: Text("Team Kami"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            leading: Icon(
              Icons.logout,
              color: AppColor.BlueGreen,
            ),
            title: Text("Log Out"),
          ),
        ],
      ),
    );
  }
}
