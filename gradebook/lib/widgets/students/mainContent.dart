import 'package:flutter/material.dart';
import 'package:gradebook/widgets/shared/table.dart';
import 'package:gradebook/widgets/students/finalReport.dart';
import 'package:gradebook/widgets/students/studentHeader.dart';

class StudentMainContent extends StatefulWidget {
  @override
  _StudentMainContentState createState() => _StudentMainContentState();
}

class _StudentMainContentState extends State<StudentMainContent> {
  String selectedOption = ""; // Variable para almacenar la opción seleccionada

  // Función que se pasa a ReportDropdown para actualizar la selección
  void _onOptionSelected(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 255, 136, 0), 
              blurRadius: 6, 
              offset: Offset(0, 2), 
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StudentHeader(),
            SizedBox(height: 16),
            ReportDropdown(onSelected: _onOptionSelected),
            SizedBox(height: 16),
            if (selectedOption.isNotEmpty) 
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 227, 242, 253),
                  borderRadius: BorderRadius.circular(16), 
                  border: Border.all(
                    color: const Color.fromARGB(255, 113, 127, 138), 
                    width: 2,
                  ),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.play_arrow, color: const Color.fromARGB(255, 243, 173, 33)),
                        SizedBox(width: 8),
                        Text(
                          'GRADEBOOK',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    GradebookTable(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
