import 'package:flutter/material.dart';

import 'constants.dart';

class ContenedorChido extends StatelessWidget {

  //Constructor para iniciar valores de atributos
  ContenedorChido({
    required this.color,
    this.contenido
  });

  final contenido;
  final color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: contenido,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,

      ),
    );
  }
}

class IconChido extends StatelessWidget {

  //Constructor para iniciar valores de atributos
  IconChido({required
      this.icono,
      this.texto
  });

  final icono;
  final texto;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icono,
        size: 80,
        color: Colors.white,),
        SizedBox(height: 15,),
        Text(texto)
      ],
    );
  }
}
//BOTON CHIDO APARTIR DE RAWMATERIALBUTTON
class BotonChido extends StatelessWidget {

  BotonChido({required this.icono, required this.funcion});

  final icono;
  final funcion;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: funcion,
      shape: CircleBorder(),
      fillColor: kcolorActive,
      constraints: BoxConstraints.tightFor(
        width: 45,
        height: 45
      ),
      child: icono,
    );
  }
}