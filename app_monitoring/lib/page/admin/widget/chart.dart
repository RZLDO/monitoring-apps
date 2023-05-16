import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData extends StatefulWidget {
  const ChartData({super.key});

  @override
  State<ChartData> createState() => _ChartData();
}

class _ChartData extends State<ChartData> {
  late TooltipBehavior _tooltipBehavior;
  List<_Radial> ChartData = [
    _Radial("Jan", 999),
    _Radial("Feb", 444),
    _Radial("Mar", 90),
    _Radial("Apr", 634),
    _Radial("Mei", 335),
    _Radial("Juni", 505),
    _Radial("Juli", 435),
    _Radial("Aug", 835),
    _Radial("sept", 735),
    _Radial("Okt", 925),
    _Radial("Nov", 235),
    _Radial("Des", 125),
  ];
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3,
        child: SfCartesianChart(
          tooltipBehavior: _tooltipBehavior,
          legend: Legend(isVisible: true, position: LegendPosition.bottom),
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries>[
            LineSeries<_Radial, String>(
                name: "Data Pengunjung Bank",
                enableTooltip: true,
                dataSource: ChartData,
                xValueMapper: ((_Radial data, index) => data.Bulan),
                yValueMapper: ((_Radial data, index) => data.Data)),
          ],
        ),
      ),
    );
  }
}

class _Radial {
  _Radial(this.Bulan, this.Data);
  String Bulan;
  int Data;
}
