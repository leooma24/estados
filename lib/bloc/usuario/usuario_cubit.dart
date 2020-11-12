import 'package:estados/models/Usuario.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super( UsuarioInitial() );
  
  void seleccionarUsuario( Usuario user ) {
    emit( UsuarioActivo(user) );
  }

  void cambiarEdad( int edad ) {
    final currentState = state;
    if( currentState is UsuarioActivo ) {
      final newUser = currentState.usuario.copiarUsuario( edad: edad );      
      emit( UsuarioActivo( newUser ));
    }
  }

  void agregarProfesion( String profesion ) {
    final currentState = state;
    if( currentState is UsuarioActivo ) {
      final profesiones = [
        ...currentState.usuario.profesiones,
        profesion
      ];
      final newUser = currentState.usuario.copiarUsuario( profesiones: profesiones);
      emit( UsuarioActivo( newUser ));
    }
  }

  void borrarUsuario() {
    emit( UsuarioInitial() );
  }

}