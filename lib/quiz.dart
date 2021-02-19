import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final Function callback;
  final List<Map<String, Object>> questions;
  final int questionIndex;

  Quiz(
      {@required this.callback,
      @required this.questions,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          questions[questionIndex]['questionTex'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((e) {
          // se crea una funcion anonima que al ser llamada
          // llama a la funcion para asi poder pasar
          // el score total
          return Answer(() => callback(e['score']), e['text']);
        }).toList()
      ],
    );
  }
}
