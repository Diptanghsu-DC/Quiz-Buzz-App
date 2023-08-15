import 'package:flutter/material.dart';
import 'package:quiz_app/homepage.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';

  List<String> selectedAnswer = [];
  List<Map<String, Object>> quizResult = [];
  int correct = 0;

  //-----------------------another method to improvise the same functionality of changing the state-----------------------
  // @override
  // void initState() {
  //   activeScreen = MyHomepage(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chosenAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questionsList.length) {
      quizResult = quizSummary();
      selectedAnswer = [];
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  List<Map<String, Object>> quizSummary() {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < selectedAnswer.length; i++) {
      summary.add(
        {
          'question_number': i,
          'question': questionsList[i].quest,
          'correct_answer': questionsList[i].answers[0],
          'chosen_answer': selectedAnswer[i],
        },
      );
      if (summary[i]['chosen_answer'] == summary[i]['correct_answer']) {
        correct++;
      }
    }
    return summary;
  }

  void restartQuiz() {
    correct = 0;
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 94, 43, 205),
                Color.fromARGB(255, 127, 26, 235),
              ],
            ),
          ),
          child: activeScreen == 'start-screen'
              ? MyHomepage(switchScreen)
              : activeScreen == 'questions-screen'
                  ? QuesScreen(
                      onSelectAnswer: chosenAnswer,
                    )
                  : ResultScreen(
                      restartQuiz: restartQuiz,
                      correct: correct,
                      total: questionsList.length,
                      summary: quizResult,
                    ),
        ),
      ),
    );
  }
}
