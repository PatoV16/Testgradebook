import 'package:flutter/material.dart';
import 'package:gradebook/widgets/shared/table.dart';
import 'package:gradebook/widgets/students/finalReport.dart';
import 'package:gradebook/widgets/students/studentHeader.dart';
class StudentMainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white, // Color de fondo de la tarjeta
          borderRadius: BorderRadius.circular(16), // Bordes redondeados
          boxShadow: [
            BoxShadow(
              color: Colors.black26, // Sombra suave
              blurRadius: 6, // Difusión de la sombra
              offset: Offset(0, 2), // Dirección de la sombra
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StudentHeader(),
            SizedBox(height: 16),
            FinalReportDropdown(),
            SizedBox(height: 16),
            GradebookTable(),
          ],
        ),
      ),
    );
  }
}

