import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) replyQuestion;

  Quiz({
    @required this.questions,
    @required this.selectedQuestion,
    @required this.replyQuestion,
  });

  bool get hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answersTexts =
        hasSelectedQuestion ? questions[selectedQuestion]['answers'] : null;

    return Column(
      children: <Widget>[
        Question(questions[selectedQuestion]['text']),
        ...answersTexts.map((answer) {
          return Answer(
            answer['text'],
            () => replyQuestion(answer['points']),
          );
        }).toList(),
      ],
    );
  }
}
