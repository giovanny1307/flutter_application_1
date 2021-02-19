import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function callBack;

  Result(this.resultScore, this.callBack);

// funciona como una computed property
  String get resultText {
    // aca puedo introducir logica
    return 'Salut! Trés Bien! $resultScore';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultText,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: callBack, child: Text('Re start quiz'))
        ],
      ),
    );
  }
}
