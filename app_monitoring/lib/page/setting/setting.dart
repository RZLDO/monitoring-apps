import 'package:app_monitoring/color.dart';
import 'package:app_monitoring/page/password/change_pass.dart';
import 'package:app_monitoring/page/setting/listmenu.dart';
import 'package:app_monitoring/page/setting/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class settingApps extends StatefulWidget {
  const settingApps({super.key});

  @override
  State<settingApps> createState() => _settingAppsState();
}

class _settingAppsState extends State<settingApps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.BackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.BlueGreen),
        leading: GestureDetector(
          onTap: (() {
            Navigator.pop(context);
          }),
          child: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Oswald',
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(Icons.people),
                SizedBox(
                  width: 20,
                ),
                TextTask(text: 'Account Setting')
              ],
            ),
            Divider(
              thickness: 1.5,
            ),
            SizedBox(
              height: 10,
            ),
            ListMenu(
              text: 'Change Password',
              ontap: (() => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChangePassword()))),
            ),
            Divider(
              thickness: 1.5,
            ),
            SizedBox(
              height: 10,
            ),
            ListMenu(
              text: 'Edit Profile',
              ontap: (() {}),
            )
          ],
        ),
      ),
    );
  }
}
