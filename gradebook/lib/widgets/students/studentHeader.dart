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
                _buildTabButton('Asistencia', isSelected: false),
                SizedBox(width: 8),
                _buildTabButton('Reporte del Estudiante', isSelected: true),
              ],
            ),
           Row( children: [CircleAvatar(
                  backgroundImage: NetworkImage('https://via.placeholder.com/40'),
                  radius: 20,
                ),
            Text('Claudia Sofia Abascal Amaya', 
                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),])
           
          ],
        ),
        Divider(height: 32, thickness: 1),
      ],
    );
  }

  Widget _buildTabButton(String text, {bool isSelected = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 2,
          ),
        ),
      ),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor: isSelected ? Colors.blue : Colors.grey,
        ),
        child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
    )
  );
  }
}