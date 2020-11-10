import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:estados/models/Usuario.dart';
import 'package:estados/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
          ? Text(usuarioService.usuario.nombre)
          : Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              child: Text('Establer Usuario', style: TextStyle( color: Colors.white ) ),
              onPressed: () {
                final user = new Usuario(
                  nombre: 'Omar Lerma',
                  edad: 38,   
                  profesiones: ['Fullstack Developer', 'Video Jugador Pro']               
                );
                usuarioService.cargarUsuario(user);
              }
            ),

            MaterialButton(
              color: Colors.blue,
              child: Text('Cambiar Edad', style: TextStyle( color: Colors.white ) ),
              onPressed: () {
                usuarioService.cambiarEdad(30);
              }
            ),

            MaterialButton(
              color: Colors.blue,
              child: Text('Añadir Profesion', style: TextStyle( color: Colors.white ) ),
              onPressed: () {
                usuarioService.agregarProfesion('Contador Público');
              }
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('Remover Usuario', style: TextStyle( color: Colors.white ) ),
              onPressed: () {                
                usuarioService.removerUsuario();
              }
            ),
          ],
        )
      ),
    );
  }
}