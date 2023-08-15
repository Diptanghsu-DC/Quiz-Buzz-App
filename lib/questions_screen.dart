import 'package:flutter/material.dart';
import 'package:quiz_app/answer_buttons.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuesScreen extends StatefulWidget {
  const QuesScreen({super.key, required this.onSelectAnswer});

  final void Function(String selectedAnswer) onSelectAnswer;

  @override
  State<QuesScreen> createState() => _QuesScreenState();
}

class _QuesScreenState extends State<QuesScreen> {
  var counter = 0;

  void switchQues(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      counter++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questionsList[counter];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.quest,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffleList().map((ans) {
              return AnswerButton(
                answer: ans,
                onTap: () {
                  switchQues(ans);
                },
              );
            }) // "..." is added at the beginning to add this element to the list of children since this is a made by mapping
          ],
        ),
      ),
    );
  }
}
