import 'package:app_monitoring/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class text extends StatelessWidget {
  final String textdata;
  final double size;
  const text({super.key, required this.textdata, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      textdata,
      style: TextStyle(
          fontFamily: 'Oswald',
          fontWeight: FontWeight.w600,
          color: AppColor.BlueGreen,
          fontSize: size),
    );
  }
}
