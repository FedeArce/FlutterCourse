import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
import './refresh.dart';

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
  var _totalScore = 0;
  final _questions = [
    {
      'question': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'question': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 5},
        {'text': 'Elefant', 'score': 3},
        {'text': 'Lion', 'score': 1}
      ],
    },
    {
      'question': 'Who\'s your favorite teacher?',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'John', 'score': 5},
        {'text': 'Dave', 'score': 3},
        {'text': 'Marques', 'score': 1}
      ],
    },
  ];

  void _refresh() {
    _totalScore = 0;
    setState(() {
      _questionIndex = 0;
    });
  }

  void _answerQuestion(int score) {
    print(_questionIndex);
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore),
        floatingActionButton: Refresh(_refresh),
      ),
    );
  }
}
