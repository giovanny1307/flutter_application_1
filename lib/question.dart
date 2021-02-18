import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // esto le dice a dart que el valor de question
  // no puede cambiar luego de inicializar
  final String questionText;

  Question(this.questionText);
  @override
  Widget build(BuildContext context) {
    // ctrl + space para ver todo lo que puedo agregar
    return Container(
      // double.infitiny toma cuanto puede de la pantalla
      width: double.infinity,
      // spacing around the container
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
