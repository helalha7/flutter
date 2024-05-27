import 'package:adv_basics2/screens/questions_screen.dart';
import 'package:adv_basics2/screens/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics2/screens/start_screen.dart';
import 'package:adv_basics2/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  void restartQuiz() {
    setState(() {
      activeScreen = StartScreen(startQuiz: switchScreen);
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(
          chosenAnswers: selectedAnswers,
          restartQuiz: restartQuiz,
        );
        selectedAnswers = [];
      });
    }
  }

  @override
  void initState() {
    activeScreen = StartScreen(
      startQuiz: switchScreen,
    );
    super.initState();
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 64, 25, 132),
                Color.fromARGB(255, 78, 78, 175),
              ],
              end: Alignment.topLeft,
              begin: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
