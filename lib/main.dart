import 'package:flutter/material.dart';
import './quizapp.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('True False Quiz'),
        centerTitle: true,
      ),
      body: const QuizApp(),
    );
  }
}
