import 'package:flutter/material.dart';

class StudentHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Estudiante', style: TextStyle(fontSize: 16, color: Colors.orange[600])),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Row(
  children: [
    _buildTabButton(
      'Asistencia',
      isSelected: false,
      icon: Icons.access_alarm,
    ),
    SizedBox(width: 8),
    _buildTabButton(
      'Reporte del Estudiante',
      isSelected: true,
      icon: Icons.report, 
    ),
  ],
),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange, width: 2),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://via.placeholder.com/40'),
                    radius: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Claudia Sofia Abascal Amaya',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.orange),
                ],
              ),
            ),
          ],
        ),
        Divider(height: 32, thickness: 1),
      ],
    );
  }

  Widget _buildTabButton(String label, {required bool isSelected, required IconData icon}) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: isSelected ? Colors.blue : Colors.grey,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white),
        SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}

}
