import 'package:flutter/material.dart';
class FinalReportDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('SELECCIONE', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        SizedBox(height: 4),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[400]!),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Gradebook', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                    SizedBox(height: 2),
                    Text('Reporte Final', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Icon(Icons.arrow_drop_down, color: Colors.grey),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
        Text('Materias Tradicionales', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
      ],
    );
  }
}