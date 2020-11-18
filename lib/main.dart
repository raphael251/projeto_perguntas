import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  void resetarContador() {
    setState(() {
      _perguntaSelecionada = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Question(perguntas[_perguntaSelecionada]),
            Answer('Resposta 1'),
            Answer('Resposta 2'),
            Answer('Resposta 3'),
            RaisedButton(
              child: Text('Resetar contador'),
              onPressed: resetarContador,
            ),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() => _PerguntaAppState();
}
