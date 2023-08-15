import 'package:flutter/material.dart';

class MyHomepage extends StatelessWidget {
  const MyHomepage(this.switchQuiz, {super.key});

  final void Function() switchQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 210,
            color: const Color.fromARGB(180, 255, 255, 255),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          OutlinedButton.icon(
            onPressed: switchQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'Start Quiz',
            ),
          ),
        ],
      ),
    );
  }
}
