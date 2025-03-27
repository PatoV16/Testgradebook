import 'package:flutter/material.dart';

class GradebookTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Materias Tradicionales',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Table(
          border: TableBorder.symmetric(
            inside: BorderSide(width: 1, color: Colors.grey.shade300),
          ),
          columnWidths: {
            0: FlexColumnWidth(3),
            1: FlexColumnWidth(1.5),
            2: FlexColumnWidth(1.5),
            3: FlexColumnWidth(1.5),
            4: FlexColumnWidth(1.5),
            5: FlexColumnWidth(1.5),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            _buildTableHeader(),
            _buildSubjectRow('Math - Tutor 1', ['8', '8', '8', '2', '2']),
            _buildSubjectRow('English - Tutor 2', ['8', '8', '8', '2', '2']),
            _buildSubjectRow('Castellano - Tutor 3', ['8', '8', '8', '2', '2']),
            _buildSubjectRow('Ciencias - Tutor 4', ['8', '8', '8', '2', '2']),
            _buildSubjectRow('Historia - Tutor 5', ['8', '8', '8', '2', '2']),
            _buildOptativaRow('Optativas', 'Economía - Tutor 3', ['8', '8', '8', '2']),
            _buildOptativaRow('', 'Historia - Tutor 3', ['8', '8', '8', '2']),
            _buildTableFooter(),
          ],
        ),
      ],
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      children: [
        _buildHeaderCell('MATERIA', Colors.blueAccent),
        _buildHeaderCell('TRIMESTRE 1\n30%', Colors.green.shade700),
        _buildHeaderCell('TRIMESTRE 2\n30%', Colors.green.shade700),
        _buildHeaderCell('TRIMESTRE 3\n30%', Colors.green.shade700),
        _buildHeaderCell('PROYECTO FINAL\n10%', Colors.orange.shade700),
        _buildHeaderCell('PROMEDIO', Colors.red.shade700),
      ],
    );
  }

  TableRow _buildSubjectRow(String subject, List<String> values) {
    return TableRow(
      children: [
        _buildTableCell(subject, isBold: true, textAlign: TextAlign.left),
        _buildTableCell(values[0]),
        _buildTableCell(values[1]),
        _buildTableCell(values[2]),
        _buildTableCell(values[3]),
        _buildTableCell(values[4]),
      ],
    );
  }

  TableRow _buildOptativaRow(String label, String subject, List<String> values) {
    return TableRow(
      children: [
        _buildTableCell(label.isEmpty ? '' : label, isBold: true, textAlign: TextAlign.left),
        _buildTableCell(subject, textAlign: TextAlign.left),
        _buildTableCell(values[0], isSecondary: true),
        _buildTableCell(values[1], isSecondary: true),
        _buildTableCell(values[2], isSecondary: true),
        _buildTableCell(values[3], isSecondary: true),
      ],
    );
  }

  TableRow _buildTableFooter() {
    return TableRow(
      decoration: BoxDecoration(color: Colors.red.shade100),
      children: [
        _buildTableCell('', isBold: true),
        _buildTableCell('10', isBold: true),
        _buildTableCell('10', isBold: true),
        _buildTableCell('10', isBold: true),
        _buildTableCell('PROMEDIO GENERAL', isBold: true, textColor: Colors.red.shade800),
        _buildTableCell('10', isBold: true),
      ],
    );
  }

Widget _buildHeaderCell(String text, Color borderColor) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white, // Fondo blanco
      border: Border.all(color: borderColor, width: 2), // Bordes del color correspondiente
    ),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: borderColor, fontWeight: FontWeight.bold), // Letras negras
    ),
  );
}


  Widget _buildTableCell(String text,
      {bool isBold = false, bool isSecondary = false, Color? textColor, TextAlign textAlign = TextAlign.center}) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: textColor ?? (isSecondary ? Colors.grey.shade600 : Colors.black),
        ),
      ),
    );
  }
}