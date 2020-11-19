import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answers;
  final void Function() onSelected;

  Answer(this.answers, this.onSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(this.answers),
        onPressed: this.onSelected,
      ),
    );
  }
}
