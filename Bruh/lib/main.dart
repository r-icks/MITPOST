import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

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
  final _questions = const [
    {
      'questionText': 'Your favourite color is?',
      'answer': [
        {'option': 'Red', 'score': 0},
        {'option': 'Blue', 'score': 7},
        {'option': 'Green', 'score': 8},
        {'option': 'Black', 'score': 10}
      ]
    },
    {
      'questionText': 'Whats your favourite animal?',
      'answer': [
        {'option': 'Frog', 'score': 0},
        {'option': 'Monkey', 'score': 7},
        {'option': 'Giraffe', 'score': 8},
        {'option': 'Snake', 'score': 10}
      ]
    },
    {
      'questionText': 'Favourite country that you want to visit?',
      'answer': [
        {'option': 'Russia', 'score': 1},
        {'option': 'Pakistan', 'score': 7},
        {'option': 'Korea', 'score': 8},
        {'option': 'Afghanistan', 'score': 10}
      ]
    },
    {
      'questionText': 'Your favourite smartphone?',
      'answer': [
        {'option': 'Samsung', 'score': 5},
        {'option': 'OnePlus', 'score': 7},
        {'option': 'iPhone', 'score': 8},
        {'option': 'Mi', 'score': 10}
      ]
    }
  ];

  @override
  var _quesIndex = 0;
  var _totalScore = 0;

  void _resetQuiz()
  {
    setState(() {
      _quesIndex=0;
      _totalScore=0;
    });
  }

  void _answerFunction(int score) {
    _totalScore+=score;
    setState(() {
      _quesIndex = _quesIndex + 1;
    });
    print("working");
    return;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Revive.'),
          backgroundColor: Color.fromARGB(216, 55, 13, 86),
        ),
        body: _quesIndex < _questions.length
            ? Quiz(
              answerFunction: _answerFunction,
                questions: _questions,
                quesIndex: _quesIndex)
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}