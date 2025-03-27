import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Margen para separar del borde
      decoration: BoxDecoration(
        color: Colors.white, // Fondo blanco
        borderRadius: BorderRadius.circular(16), // Bordes redondeados
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3), // Sombra inferior
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.transparent, // Hace que tome el color del Container
        elevation: 0, // Quitamos la sombra del AppBar
        leading: IconButton(
          icon: Icon(Icons.menu, color: Color(0xFF047DFF)), // Ícono del menú
          onPressed: () {
            // Acción del menú
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.chat, color: Colors.blue), // Ícono de chat/soporte
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.help_outline, color: Colors.red), // Ícono de ayuda
              onPressed: () {},
            ),
            SizedBox(width: 10), // Espacio antes del perfil
            Row(
              children: [
                
                SizedBox(width: 8), // Espaciado entre imagen y texto
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: "edu",
        style: TextStyle(
          color: Colors.orange, // Naranja para "edu"
          fontSize: 28,         // Tamaño más grande
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto', // Puedes cambiar por otra fuente como 'Montserrat'
          shadows: [
            Shadow(
              blurRadius: 2,
              color: Colors.black.withOpacity(0.3),
              offset: Offset(1, 1),
            ),
          ],
        ),
      ),
      TextSpan(
        text: "Flix",
        style: TextStyle(
          color: Colors.blue,   // Azul para "Flix"
          fontSize: 28,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
          shadows: [
            Shadow(
              blurRadius: 2,
              color: Colors.black.withOpacity(0.3),
              offset: Offset(1, 1),
            ),
          ],
        ),
      ),
    ],
  ),
)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 16); // Ajustamos la altura
}
