import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;

  Answer(this.text);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(this.text),
      onPressed: null,
    );
  }
}
