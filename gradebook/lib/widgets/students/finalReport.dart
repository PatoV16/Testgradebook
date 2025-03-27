import 'package:flutter/material.dart';

class ReportDropdown extends StatefulWidget {
  final Function(String) onSelected; // Función para notificar la selección

  ReportDropdown({required this.onSelected});

  @override
  _ReportDropdownState createState() => _ReportDropdownState();
}

class _ReportDropdownState extends State<ReportDropdown> {
  String? selectedOption; 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SELECCIONE',
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
        SizedBox(height: 4),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 255, 149, 2)!),
            borderRadius: BorderRadius.circular(4),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedOption,
              hint: Text("Seleccione una opción"),
              icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
              isExpanded: true,
              items: ['Reporte Final', 'Reporte por Trimestre'].map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option, style: TextStyle(fontWeight: FontWeight.bold)),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedOption = newValue;
                  });
                  widget.onSelected(newValue);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
