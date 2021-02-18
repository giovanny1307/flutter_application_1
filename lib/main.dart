import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

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

  @override
  build(context) {
    // pase el pointer, no la función.
    var questions = [
      {
        'questionTex': 'quelle est ta couleur préférée?',
        'answers': ['rouge', 'vert', 'blanc', 'jaune']
      },
      {
        'questionTex': 'quel est ton animal préféré?',
        'answers': ['chat', 'chien', 'lion']
      },
      {
        'questionTex': 'Quelle est votre émission préférée?',
        'answers': ['braking bad', 'got', 'mr robot', 'glee']
      }
    ];

    void _answerQuestion() {
      setState(() {
        if (_questionIndex == questions.length - 1) {
          return;
        }
        _questionIndex = _questionIndex + 1;
        print("Current question index => $_questionIndex");
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: Column(
          children: <Widget>[
            Question(
              questions[_questionIndex]['questionTex'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>).map((e) {
              return Answer(_answerQuestion, e);
            }).toList()
          ],
        ),
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
