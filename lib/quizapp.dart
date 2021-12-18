import 'package:flutter/material.dart';
import 'package:linear_quizapp/models/questions.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _totallCurrectAnswer = 0;
  final allQuestion = Questions();

  Widget quizExpandedElevatedButton(
      {required String buttonText,
      required Color buttonColor,
      required bool buttonCondition}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: buttonColor),
        child: Text(buttonText),
        onPressed: () {
          setState(() {
            if (allQuestion.gamefinish() == true) {
              AlertDialog alertDialog = AlertDialog(
                title: Text('Quiz Finish'),
                content: Container(
                  height: 100,
                  child: Column(
                    children: [
                      Text(
                        _totallCurrectAnswer.toString(),
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        'OPPS! game finish and click ok button try Again',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('ok'))
                ],
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alertDialog;
                },
              );
              allQuestion.resetQuiz();
              allQuestion.guestanswer.clear();
              _totallCurrectAnswer = 0;
            } else {
              final currectanswer = allQuestion.answer;
              if (currectanswer == buttonCondition) {
                allQuestion.guestanswer.add(
                  Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 25,
                  ),
                );
                _totallCurrectAnswer++;
              } else {
                allQuestion.guestanswer.add(
                  Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 25,
                  ),
                );
              }
            }
            allQuestion.updateQuestion();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: Text(
                        allQuestion.question,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: allQuestion.guestanswer,
                    )
                  ],
                )),
            quizExpandedElevatedButton(
              buttonText: 'True',
              buttonColor: Colors.green,
              buttonCondition: true,
            ),
            quizExpandedElevatedButton(
              buttonText: 'Flase',
              buttonColor: Colors.red,
              buttonCondition: false,
            ),
          ],
        ),
      ),
    );
  }
}
