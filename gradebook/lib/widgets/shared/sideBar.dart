import 'package:flutter/material.dart';
import 'package:gradebook/widgets/students/mainContent.dart';

class ExpandableSidebar extends StatefulWidget {
  final Function(Widget) onItemSelected; // Agregar este parámetro

  ExpandableSidebar({required this.onItemSelected}); // Constructor

  @override
  _ExpandableSidebarState createState() => _ExpandableSidebarState();
}

class _ExpandableSidebarState extends State<ExpandableSidebar> {
  double _sidebarWidth = 70;
  bool _isExpanded = false;

  String selectedItem = ''; // Variable para almacenar la opción seleccionada

  final Map<String, Color> _itemColors = {
    'Integrador': Color(0xFFFFA726),
    'Asistencia': Color(0xFFE65100),
    'Classroom': Color(0xFFD32F2F),
    'Course Builder': Color(0xFF1976D2),
    'Calificaciones': Color(0xFF039BE5),
    'Matriculación': Color(0xFF7CB342),
    'Grade Books': Color(0xFF388E3C),
  };

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _expandSidebar(),
      onExit: (_) => _collapseSidebar(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: _sidebarWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 5),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildSidebarItem(Icons.dashboard, 'Integrador', 'Integrador'),
                  _buildSidebarItem(Icons.check_circle_outline, 'Asistencia', 'Asistencia'),
                  _buildSidebarItem(Icons.school, 'Classroom', 'Classroom'),
                  _buildSidebarItem(Icons.rocket_launch, 'Course Builder', 'Course Builder'),
                  _buildSidebarItem(Icons.grade, 'Calificaciones', 'Calificaciones'),
                  _buildSidebarItem(Icons.people, 'Matriculación', 'Matriculación'),
                  _buildSidebarItem(Icons.book, 'Grade Books', 'Grade Books'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSidebarItem(IconData icon, String title, String key) {
  final itemColor = _itemColors[title] ?? Colors.grey;
  bool isSelected = selectedItem == key;

  return GestureDetector(
    onTap: () {
      _onItemSelected(key);
    },
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blueAccent.withOpacity(0.9) : itemColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: isSelected ? [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          )
        ] : [],
        border: isSelected ? Border.all(
          color: Colors.white,
          width: 2,
        ) : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 8),
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 28),
              if (isSelected && !_isExpanded)
                Positioned(
                  right: 8,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          if (_isExpanded)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          SizedBox(height: 8),
        ],
      ),
    ),
  );
}

  void _expandSidebar() {
    setState(() {
      _sidebarWidth = 150;
      _isExpanded = true;
    });
  }

  void _collapseSidebar() {
    setState(() {
      _sidebarWidth = 70;
      _isExpanded = false;
    });
  }

  void _onItemSelected(String key) {
    Widget page = Center(child: Text('Página no encontrada')); // Valor predeterminado

    setState(() {
      selectedItem = key; 
    });

    switch (key) {
      case 'Integrador':
        //page = StudentMainContent();
        break;
      case 'Asistencia':
        // page = AsistenciaPage();
        break;
      case 'Classroom':
        // page = ClassroomPage();
        break;
      case 'Course Builder':
        // page = CourseBuilderPage();
        break;
      case 'Calificaciones':
         page = StudentMainContent();
        break;
      case 'Matriculación':
        // page = MatriculacionPage();
        break;
      case 'Grade Books':
        // page = GradeBooksPage();
        break;
    }

    widget.onItemSelected(page); 
  }
}
