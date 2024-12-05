import 'package:flutter/material.dart';
import 'package:frontend/widgets/header_cell.dart';
import 'package:frontend/widgets/table_cell.dart';

class MyTable extends StatelessWidget {
  final List<String> headers;
  final List<List<String>> rows;
  const MyTable({super.key, required this.headers, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.black, width: 1.5),
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.blue[200]),
          children: headers
              .map((header) => MyHeaderCell(text: header))
              .toList(),
        ),
        ...rows.map(
          (row) => TableRow(
            children: row
                .map(
                  (cell) => MyTableCell(text: cell)
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}