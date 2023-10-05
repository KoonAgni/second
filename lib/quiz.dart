import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/questions.dart';
import 'package:flutter_application_2/questions_screen.dart';
import 'package:flutter_application_2/results_screen.dart';
import 'package:flutter_application_2/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedanswers = [];
  Widget? activeScreen;

  void chooseAnswer(String answer) {
    selectedanswers.add(answer);
    if (selectedanswers.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(chosenAnswers: selectedanswers);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.deepPurple,
                const Color.fromARGB(255, 202, 148, 211),
              ],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
