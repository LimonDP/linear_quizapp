import 'package:flutter/cupertino.dart';

import '../models/question.dart';

class Questions {
  final List<Question> _questionList = [
    Question(
      question: '((2 ^ 2)^ 3) = 25',
      questionCondition: false,
    ),
    Question(question: ' 5 > 10 or 5 < 7', questionCondition: true),
    Question(
      question: '30% of x is equal to 0.03x',
      questionCondition: false,
    ),
    Question(
        question:
            ' "x is at most equal to 9" is written mathematically as x < 9.',
        questionCondition: false),
    Question(
      question: '3^20 + 3^20 + 3^20 = 3^21',
      questionCondition: true,
    ),
    Question(
      question: '1000/0 = 0.',
      questionCondition: false,
    ),
    Question(
      question: '0/1000 = 0.',
      questionCondition: true,
    ),
    Question(
      question: '0.00000010 = 1.',
      questionCondition: true,
    ),
  ];

  List<Icon> guestanswer = [];
  int questionFirstIndex = 0;
  void updateQuestion() {
    if (questionFirstIndex < _questionList.length - 1) {
      questionFirstIndex++;
    }
  }

  bool gamefinish() {
    if (questionFirstIndex >= _questionList.length - 1) {
      return true;
    }
    return false;
  }

  get question {
    return _questionList[questionFirstIndex].question;
  }

  get answer {
    return _questionList[questionFirstIndex].questionCondition;
  }

  void resetQuiz() {
    questionFirstIndex = -1;
  }
}
