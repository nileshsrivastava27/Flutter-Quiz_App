import 'package:first_app/quiz.dart';
import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

import './question.dart';
import './ans.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color',
      'answers': [
        {'text': 'Black', 'score': 9},
        {'text': 'Red', 'score': 10},
        {'text': 'Green', 'score': 7},
        {'text': 'Blue', 'score': 8}
      ],
    },
    {
      'questionText': 'What\'s your favourite animal',
      'answers': [
        {'text': 'Lion', 'score': 9},
        {'text': 'Tiger', 'score': 10},
        {'text': 'Elephant', 'score': 7},
        {'text': 'Cheetah', 'score': 8}
      ],
    },
    {
      // 'questionText': 'Who\'s the prettiest girl you know?',
      // 'answers': [
      //   {'text': 'Kanishka', 'score': 10},
      //   {'text': 'Select A', 'score': 9},
      //   {'text': 'Select A', 'score': 7},
      //   {'text': 'Select A', 'score': 8}

      'questionText': 'What laptop you like the most?',
      'answers': [
        {'text': 'Macbook Pro', 'score': 10},
        {'text': 'Select A', 'score': 9},
        {'text': 'Select A', 'score': 7},
        {'text': 'Select A', 'score': 8}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
    _questionIndex = 0;
    _totalScore = 0;
      
    });


  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Quiz App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
