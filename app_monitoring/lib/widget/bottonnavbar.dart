import 'package:app_monitoring/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomButtonNavbar extends StatefulWidget {
  const CustomButtonNavbar({super.key});

  @override
  State<CustomButtonNavbar> createState() => _CustomButtonNavbarState();
}

class _CustomButtonNavbarState extends State<CustomButtonNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Padding(
        padding: EdgeInsets.all(0),
        child: GNav(
            onTabChange: (value) {},
            activeColor: AppColor.orangeColor,
            gap: 8,
            padding: EdgeInsets.only(left: 10),
            tabs: const [
              GButton(
                icon: Icons.dashboard,
                iconColor: Colors.blueGrey,
                text: 'Dashboard',
              ),
              GButton(
                icon: Icons.add_task,
                iconColor: Colors.blueGrey,
                text: 'Task',
              ),
              GButton(
                icon: Icons.settings,
                iconColor: Colors.blueGrey,
                text: 'Setting',
              ),
              GButton(
                icon: Icons.logout,
                iconColor: Colors.blueGrey,
                text: 'Log Out',
              )
            ]),
      ),
    );
  }
}
