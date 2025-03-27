import 'package:flutter/material.dart';

class GradebookTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Materias Tradicionales',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Table(
              border: TableBorder.symmetric(
                inside: BorderSide(color: Colors.grey.shade300, width: 1),
                outside: BorderSide.none,
              ),
              columnWidths: {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(1),
                4: FlexColumnWidth(1),
                5: FlexColumnWidth(1),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                _buildTableHeader(),
                _buildSubjectRow('Math - Tutor 1', ['8', '8', '8', '2', '2']),
                _buildSubjectRow('English - Tutor 2', ['8', '8', '8', '2', '2']),
                _buildSubjectRow('Castellano - Tutor 3', ['8', '8', '8', '2', '2']),
                _buildSubjectRow('Ciencias - Tutor 4', ['8', '8', '8', '2', '2']),
                _buildSubjectRow('Historia - Tutor 5', ['8', '8', '8', '2', '2']),
                _buildTableFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      decoration: BoxDecoration(color: Colors.white),
      children: [
        _buildHeaderCell('MATERIA', Colors.blue),
        _buildHeaderCell('TRIMESTRE 1\n30%', Colors.green),
        _buildHeaderCell('TRIMESTRE 2\n30%', Colors.green),
        _buildHeaderCell('TRIMESTRE 3\n30%', Colors.green),
        _buildHeaderCell('PROYECTO FINAL\n10%', Colors.orange),
        _buildHeaderCell('PROMEDIO', Colors.red),
      ],
    );
  }

  TableRow _buildSubjectRow(String subject, List<String> values) {
    return TableRow(
      children: [
        _buildTableCell(subject, isBold: true, textAlign: TextAlign.left, backgroundColor: Colors.white),
        for (var i = 0; i < values.length; i++)
          _buildTableCell(values[i], textColor: i == 4 ? Colors.red : Colors.black, backgroundColor: Colors.white),
      ],
    );
  }

  TableRow _buildTableFooter() {
    return TableRow(
      decoration: BoxDecoration(color: Colors.red.shade100),
      children: [
        _buildTableCell('', isBold: true, backgroundColor: Colors.white),
        _buildTableCell('10', isBold: true, backgroundColor: Colors.white),
        _buildTableCell('10', isBold: true, backgroundColor: Colors.white),
        _buildTableCell('10', isBold: true, backgroundColor: Colors.white),
        _buildTableCell('PROMEDIO GENERAL', isBold: true, textColor: Colors.red, backgroundColor: Colors.white),
        _buildTableCell('10', isBold: true, backgroundColor: Colors.white),
      ],
    );
  }

  Widget _buildHeaderCell(String text, Color borderColor) {
    return IntrinsicWidth( 
      child: IntrinsicHeight( 
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0), // Padding reducido
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: borderColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildTableCell(String text, {bool isBold = false, Color? textColor, TextAlign textAlign = TextAlign.center, Color backgroundColor = Colors.white}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: Colors.grey.shade300, width: 5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: textColor ?? Colors.black,
          fontSize: 12,
        ),
      ),
    );
  }
}
