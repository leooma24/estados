import 'package:estados/bloc/usuario/usuario_bloc.dart';
import 'package:estados/models/Usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UsuarioBloc, UsuarioState>(
          builder: ( _ , state) {
            if( state.existeUsuario) {
              return Text(state.usuario.nombre);
            } else {
              return Text('Pagina 2');
            }
          }),
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
                  profesiones: ['Programador', 'Gamer']
                );
                usuarioBloc.add(
                  ActivarUsuario( user )
                );                
              }
            ),

            MaterialButton(
              color: Colors.blue,
              child: Text('Cambiar Edad', style: TextStyle( color: Colors.white ) ),
              onPressed: () {
                usuarioBloc.add( CambiarEdad( 30 ) );
              }
            ),

            MaterialButton(
              color: Colors.blue,
              child: Text('Añadir Profesion', style: TextStyle( color: Colors.white ) ),
              onPressed: () {
                usuarioBloc.add( AgregarProfesion('Psicopata') );
              }
            )
          ],
        )
      ),
    );
  }
}