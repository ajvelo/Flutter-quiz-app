import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/quiz.dart';
import 'package:flutter_quiz_app/result.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "What's your favorite color?",
      'answers': [
        {"text": 'Black', "score": 10},
        {"text": 'Red', "score": 5},
        {"text": "Green", "score": 3},
        {"text": "White", "score": 1}
      ],
    },
    {
      'questionText': "What's your favorite animal?",
      'answers': [
        {"text": 'Rabbit', "score": 3},
        {"text": 'Snake', "score": 11},
        {"text": "Elephant", "score": 4},
        {"text": "Lion", "score": 9}
      ],
    },
    {
      'questionText': "What's your favorite film?",
      'answers': [
        {"text": 'Pulp Fiction', "score": 10},
        {"text": 'Tenet', "score": 3},
        {"text": "Titanic", "score": 5},
        {"text": "Joker", "score": 8}
      ],
    },
    {
      'questionText': "What's your favorite city?",
      'answers': [
        {"text": 'London', "score": 10},
        {"text": 'Paris', "score": 1},
        {"text": "Rome", "score": 3},
        {"text": "New York", "score": 5}
      ],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _reset() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex += 1;
        _totalScore += score;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App!"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(
                finalScore: _totalScore,
                reset: _reset,
              ),
      ),
    );
  }
}
