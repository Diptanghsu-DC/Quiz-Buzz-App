import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_summary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({
    super.key,
    required this.restartQuiz,
    required this.correct,
    required this.total,
    required this.summary,
  });

  final void Function() restartQuiz;
  final int correct;
  final int total;
  List<Map<String, Object>> summary;

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correct questions out of $total correctly !',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuizSummary(
              summaryList: summary,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: restartQuiz,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.restart_alt_rounded),
              label: const Text('Restart'),
            )
          ],
        ),
      ),
    );
  }
}
