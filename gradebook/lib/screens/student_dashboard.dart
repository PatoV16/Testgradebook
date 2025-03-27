import 'package:flutter/material.dart';
import 'package:gradebook/widgets/shared/navBar.dart';
import 'package:gradebook/widgets/shared/sideBar.dart';
import 'package:gradebook/widgets/students/mainContent.dart';

class StudentDashboard extends StatefulWidget {
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  Widget? _selectedPage; // Variable para almacenar la vista actual

  // Método para cambiar de vista
  void _onSelectPage(Widget page) {
    setState(() {
      _selectedPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar (menú lateral)
          SizedBox(
            width: 100,
            child: ExpandableSidebar(
              onItemSelected: (Widget page) {
                _onSelectPage(page);
              },
            ),
          ),

          // Contenedor principal
          Expanded(
            child: Column(
              children: [
                NavBar(), // Navbar en la parte superior
                Expanded(
                  child: _selectedPage ??
                      Center(
                        child: Text(
                          "Seleccione una opción",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ), // Muestra mensaje si no hay selección
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
