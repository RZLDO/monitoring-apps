import 'package:app_monitoring/data/data.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_monitoring/models/usermodel.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TableAdmin extends StatefulWidget {
  const TableAdmin({super.key});

  @override
  State<TableAdmin> createState() => _TableAdminState();
}

class _TableAdminState extends State<TableAdmin> {
  late List<employe> Employe;
  var Columndata = ['Nama', 'Task', 'Status'];
  @override
  void initState() {
    this.Employe = List.of(data);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: getDataColumn(Columndata),
      rows: getRows(Employe),
    );
  }

  List<DataColumn> getDataColumn(List<String> Columndata) =>
      Columndata.map((String column) => DataColumn(label: Text(column)))
          .toList();

  List<DataRow> getRows(List<employe> Employe) =>
      Employe.map((employe Employe) {
        final cells = [Employe.Nama, Employe.Task, Employe.Status];
        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();
}
