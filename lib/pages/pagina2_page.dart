import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              child: Text('Establer Usuario', style: TextStyle( color: Colors.white ) ),
              onPressed: () {

              }
            ),

            MaterialButton(
              color: Colors.blue,
              child: Text('Cambiar Edad', style: TextStyle( color: Colors.white ) ),
              onPressed: () {

              }
            ),

            MaterialButton(
              color: Colors.blue,
              child: Text('Añadir Profesion', style: TextStyle( color: Colors.white ) ),
              onPressed: () {

              }
            )
          ],
        )
      ),
    );
  }
}