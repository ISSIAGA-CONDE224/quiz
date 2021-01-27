import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MySuperApplication());

class MySuperApplication extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MySuperApplicationState();
  }
}


class _MySuperApplicationState extends State<MySuperApplication> {
  final _questions = const [
    {
      'questionText': 'Quelle est ta couleur preferee ?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Green', 'score': 2},
        {'text': 'Red', 'score': 3},
        {'text': 'White', 'score': 4}
      ]
    },
    {
      'questionText': 'Quel est ton animal prefere?',
      'answers': [
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Snake', 'score': 2},
        {'text': 'Lion', 'score': 3},
        {'text': 'Elephant', 'score': 5}
      ]
    },
    {
      'questionText': 'Qui est ton enseignent prefere?',
      'answers': [
        {'text': 'Pokpa', 'score': 1},
        {'text': 'Aly', 'score': 2},
        {'text': 'Sahid', 'score': 3},
        {'text': 'Issiaga', 'score': 6}
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0; 
    });
  }
 
  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < _questions.length) {
      print('La taille du tableau dépassée !');
    } else {
      print('terminé');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('CONDE ISSIAGA'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              questions: _questions,
              questionIndex: _questionIndex,
              answerQuestion: _answerQuestion,
            )
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
