import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
  var questions = [
    {
      'question 1': 'What\'s your favorite color?',
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'question 1': 'What\'s your favorite animal?',
      'answers': ['Rabbit', 'Snake', 'Elefant', 'Lion'],
    },
    {
      'question 1': 'Who\'s your favorite teacher?',
      'answers': ['Max', 'John', 'Dave', 'Marques'],
    },
  ];

  void _answerQuestion() {
    print(_questionIndex);
    setState(() {
      if (_questionIndex == 2)
        _questionIndex = 0;
      else
        _questionIndex++;
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
            Question(questions[_questionIndex]['question 1']),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
