import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final void Function() resetQuiz;

  Result({this.resetQuiz, this.totalScore});

  String get resultText {
    if (totalScore < 8) {
      return 'Parabéns!';
    } else if (totalScore < 12) {
      return 'Você é bom!';
    } else if (totalScore < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            resultText,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
          textColor: Colors.blue,
          child: Text(
            "Resetar Questionário >",
            style: TextStyle(fontSize: 22),
          ),
          onPressed: resetQuiz,
        ),
      ],
    );
  }
}
