import 'package:app_monitoring/page/admin/inputdata.dart';
import 'package:app_monitoring/page/login/loginpage.dart';
import 'package:app_monitoring/page/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
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
          leading: Icon(Icons.dashboard),
          title: Text("Dashboard"),
          onTap: (() {}),
        ),
        ListTile(
          leading: Icon(Icons.data_array),
          title: Text("Input Data"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => InputData())));
          },
        ),
        ListTile(
          leading: Icon(Icons.input),
          title: Text('Input Data Karyawan'),
          onTap: (() {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => RegisterAccount())));
          }),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 1,
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("Log Out"),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        )
      ]),
    );
  }
}
