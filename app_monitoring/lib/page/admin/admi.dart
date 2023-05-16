import 'package:app_monitoring/color.dart';
import 'package:app_monitoring/page/admin/widget/chart.dart';
import 'package:app_monitoring/page/admin/widget/drawer.dart';
import 'package:app_monitoring/page/admin/widget/table.dart';
import 'package:app_monitoring/widget/drawercustom.dart';
import 'package:flutter/material.dart';

class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({super.key});
  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.BlueGreen),
        backgroundColor: Colors.white,
        actions: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 6,
          ),
          Image.asset(
            "asset/image/bsilong.png",
            width: 79,
            height: 70,
          ),
          Spacer(),
          IconButton(onPressed: (() {}), icon: Icon(Icons.notifications)),
        ],
      ),
      drawer: AdminDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 5),
          child: Column(
            children: [ChartData(), TableAdmin()],
          ),
        ),
      ),
    );
  }
}
