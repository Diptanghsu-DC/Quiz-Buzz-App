import 'package:flutter/material.dart';

class QuizSummary extends StatelessWidget {
  const QuizSummary({required this.summaryList, super.key});

  final List<Map<String, Object>> summaryList;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryList.map(
            (data) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 15.0,
                    backgroundColor: Color.fromARGB(255, 247, 78, 134),
                    child: Text(
                      ((data['question_number'] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (data['question']).toString(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          (data['chosen_answer']).toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color:
                                data['chosen_answer'] == data['correct_answer']
                                    ? const Color.fromARGB(255, 60, 235, 30)
                                    : Colors.red,
                          ),
                        ),
                        Text(
                          (data['correct_answer']).toString(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 177, 127, 231),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
