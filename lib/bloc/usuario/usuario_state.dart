

part of 'usuario_cubit.dart';

abstract class UsuarioState {}

class UsuarioInitial extends UsuarioState {
  final existeUsuario = false;
}

class UsuarioActivo extends UsuarioState {
  final existeUsuario = true;
  final Usuario usuario;

  UsuarioActivo(this.usuario);

}