import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;

  Result(this.totalScore);

  String get resultPhrase {
    String resultText = 'You did ' + totalScore.toString() + '\n';
    if (totalScore <= 10) {
      resultText += 'You are white';
    } else if (totalScore <= 20) {
      resultText += 'You are grey';
    } else {
      resultText += 'You are black';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        resultPhrase,
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
