import 'dart:async';

import 'package:estados/models/Usuario.dart';

class _UsuarioService {
  Usuario _usuario;
  
  StreamController<Usuario> _usuarioStreamController = new StreamController<Usuario>.broadcast();  
  

  Usuario get usuario => this._usuario;
  bool get existeUsuario => ( this._usuario != null ) ? true : false;

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  void cargarUsuario( Usuario user ) {
    this._usuario = user;
    _usuarioStreamController.add( this._usuario );
  }

  void cambiarEdad( int edad ) {
    this._usuario.edad = edad;
    _usuarioStreamController.add( this._usuario );
  }

  dispose() {
    _usuarioStreamController?.close();
  }
}

final usuarioService = new _UsuarioService();

