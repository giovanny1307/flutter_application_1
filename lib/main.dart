//const => compile time constant, el
import 'package:flutter/material.dart';
import 'package:flutter_application_1/quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

// hay parametros poscionales y named, los named no
// requieren ir en orden
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// cuando ud pasa esto a stateful
// el build method esta adentro del state
// cada vez que hay un cambio en el state vuelve a llamar el
// state y por ende cambia el estado y re construye el build
// al colocar _ al inicio de un nombre ud define como privado
// al elemento
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  build(context) {
    // pase el pointer, no la función.
    // se usa final si el valor nunca nunca cambia luego de ser asignado
    // el const como que no se puede inicializar luego de declarada
    // la propiedad

    //final => runtime constant value, se puede asignar el valor
    // luego de que corre el codigo

    const questions = [
      {
        'questionTex': 'quelle est ta couleur préférée?',
        'answers': [
          {'text': 'rouge', 'score': 10},
          {'text': 'vert', 'score': 4},
          {'text': 'blanc', 'score': 2},
          {'text': 'jaune', 'score': 12}
        ]
      },
      {
        'questionTex': 'quel est ton animal préféré?',
        'answers': [
          {'text': 'chat', 'score': 10},
          {'text': 'chien', 'score': 10},
          {'text': 'lion', 'score': 10}
        ]
      },
      {
        'questionTex': 'Quelle est votre émission préférée?',
        'answers': [
          {'text': 'braking bad', 'score': 10},
          {'text': 'Game of Thrones', 'score': 10},
          {'text': 'Mr Robot', 'score': 10},
          {'text': 'Glee', 'score': 100}
        ]
      }
    ];

    void _answerQuestion(int score) {
      print('Score => $score');
      setState(() {
        _totalScore = _totalScore + score;
        _questionIndex = _questionIndex + 1;
      });
    }

    print('Current Score => $_totalScore');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                callback: _answerQuestion,
                questions: questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

/**
  ElevatedButton(onPressed: _answerQuestion, child: Text('Option 1')),
            ElevatedButton(
                onPressed: () => print('Option 2 pressed'),
                child: Text('Option 2')),
            ElevatedButton(
                onPressed: () {
                  print('Optiom 3 chosen');
                },
                child: Text('Option 3')), 
 
 */
