import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

main() => runApp(QuestionApp());

class _QuestionAppState extends State<QuestionApp> {
  var _selectedQuestion = 0;
  final _questions = const [
    {
      'text': 'Qual é a sua cor favorita?',
      'answers': ['Azul', 'Branco', 'Preto', 'Amarelo'],
    },
    {
      'text': 'Qual é o seu animal favorito?',
      'answers': ['Elefante', 'Cobra', 'Coelho', 'Papagaio'],
    },
    {
      'text': 'Qual é o seu desenvolvedor favorito?',
      'answers': ['Lucas', 'Raphael', 'Leonardo', 'Holando'],
    }
  ];

  void _replyQuestion() {
    setState(() {
      _selectedQuestion++;
    });
    print(_selectedQuestion);
  }

  bool get hasSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> answersTexts =
        hasSelectedQuestion ? _questions[_selectedQuestion]['answers'] : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: hasSelectedQuestion
            ? Column(
                children: <Widget>[
                  Question(_questions[_selectedQuestion]['text']),
                  ...answersTexts
                      .map((t) => Answer(t, _replyQuestion))
                      .toList(),
                ],
              )
            : null,
      ),
    );
  }
}

class QuestionApp extends StatefulWidget {
  _QuestionAppState createState() => _QuestionAppState();
}
