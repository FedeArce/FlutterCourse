import 'package:flutter/material.dart';
import './question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _questions = [
    'First question',
    'Second question',
  ];

  void _answerQuestion() {
    print(_questionIndex);
    setState(() {
      if (_questionIndex == 0)
        _questionIndex = 1;
      else
        _questionIndex = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz app'),
        ),
        body: Column(
          children: [
            Question(_questions.elementAt(_questionIndex)),
            Row(
              children: [
                RaisedButton(
                  child: Text('Answer 1'),
                  onPressed: _answerQuestion,
                ),
                RaisedButton(
                  child: Text('Answer 2'),
                  onPressed: _answerQuestion,
                ),
                RaisedButton(
                  child: Text('Answer 3'),
                  onPressed: _answerQuestion,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
