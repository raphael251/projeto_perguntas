import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

main() => runApp(QuestionApp());

class _QuestionAppState extends State<QuestionApp> {
  var _selectedQuestion = 0;
  int _totalScore = 0;
  final _questions = const [
    {
      'text': 'Qual é a sua cor favorita?',
      'answers': [
        {'text': 'Azul', 'points': 10},
        {'text': 'Branco', 'points': 5},
        {'text': 'Preto', 'points': 3},
        {'text': 'Amarelo', 'points': 2},
      ],
    },
    {
      'text': 'Qual é o seu animal favorito?',
      'answers': [
        {'text': 'Elefante', 'points': 10},
        {'text': 'Cobra', 'points': 5},
        {'text': 'Coelho', 'points': 3},
        {'text': 'Papagaio', 'points': 2},
      ],
    },
    {
      'text': 'Qual é o seu desenvolvedor favorito?',
      'answers': [
        {'text': 'Lucas', 'points': 10},
        {'text': 'Raphael', 'points': 5},
        {'text': 'Leonardo', 'points': 3},
        {'text': 'Holando', 'points': 2},
      ],
    }
  ];

  void _replyQuestion(int answerPoints) {
    setState(() {
      _selectedQuestion++;
      _totalScore += answerPoints;
    });
    print(_selectedQuestion);
  }

  bool get hasSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  void _resetQuiz() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: hasSelectedQuestion
            ? Quiz(
                questions: _questions,
                replyQuestion: _replyQuestion,
                selectedQuestion: _selectedQuestion,
              )
            : Result(
                resetQuiz: _resetQuiz,
                totalScore: _totalScore,
              ),
      ),
    );
  }
}

class QuestionApp extends StatefulWidget {
  _QuestionAppState createState() => _QuestionAppState();
}
