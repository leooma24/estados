import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/Usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = BlocProvider.of<UsuarioCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title:  BlocBuilder<UsuarioCubit, UsuarioState>(
          builder: (_, state) {
            if( state is UsuarioActivo ) {
              return Text(state.usuario.nombre);
            } else {
              return Text('Pagina 2');
            }
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
                final newUser = Usuario(
                  nombre: 'Omar Lerma',
                  edad: 38,
                  profesiones: ['Desarrollador PHP', 'Gamer']
                );
                usuarioCubit.seleccionarUsuario(newUser);
              }
            ),

            MaterialButton(
              color: Colors.blue,
              child: Text('Cambiar Edad', style: TextStyle( color: Colors.white ) ),
              onPressed: () {
                usuarioCubit.cambiarEdad(30);
              }
            ),

            MaterialButton(
              color: Colors.blue,
              child: Text('Añadir Profesion', style: TextStyle( color: Colors.white ) ),
              onPressed: () {
                usuarioCubit.agregarProfesion('Loco por Flutter');
              }
            )
          ],
        )
      ),
    );
  }
}