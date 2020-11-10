import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:estados/services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: usuarioService.existeUsuario 
        ? InformacionUsuario() 
        : Center(child: Text('No hay usuario seleccionado')),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.accessibility_new ) ,
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  const InformacionUsuario({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold) ),
          Divider(),

          ListTile( title: Text('Nombre: ${ usuarioService.usuario.nombre }') ),
          ListTile( title: Text('Edad: ${ usuarioService.usuario.edad }') ),

          Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold) ),
          Divider(),

          ...usuarioService.usuario.profesiones.map( 
            (profesion) => ListTile( title: Text(profesion) ) 
          ).toList()       
          
        ],
      )
    );
  }
}