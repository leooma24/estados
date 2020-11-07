import 'package:estados/models/Usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,                    
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot){
            return snapshot.hasData
            ? Text('Nombre: ${ snapshot.data.nombre}')
            : Text('Pagina 2');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              child: Text('Establer Usuario', style: TextStyle( color: Colors.white ) ),
              onPressed: () {
                final user = Usuario(
                  nombre: 'Omar Lerma',
                  edad: 38,
                  profesiones: ['Doctor', 'Sistemas Computaciones', 'Electrico']
                );
                usuarioService.cargarUsuario(user);
              }
            ),

            MaterialButton(
              color: Colors.blue,
              child: Text('Cambiar Edad', style: TextStyle( color: Colors.white ) ),
              onPressed: () {
                usuarioService.cambiarEdad( 30 );
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