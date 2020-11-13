
import 'package:bloc/bloc.dart';

import 'package:estados/models/Usuario.dart';

part 'usuario_state.dart';
part 'usuario_event.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super( UsuarioState() );

  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* { 
    if( event is ActivarUsuario ) {
      yield state.copyWith( usuario: event.usuario );
    } else if( event is CambiarEdad ) {
      yield state.copyWith( usuario: state.usuario.copyWith( edad: event.edad ));
    } else if( event is AgregarProfesion ) {
      final profesiones = [
        ...state.usuario.profesiones,
        event.profesion
      ];
      yield state.copyWith( usuario: state.usuario.copyWith( profesiones: profesiones));
    } else if( event is BorrarUsuario ) {
      yield state.estadoInicial();
    }
  }

}