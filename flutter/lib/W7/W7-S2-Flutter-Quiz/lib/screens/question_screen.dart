import 'package:flutter/material.dart';
import '../model/quiz.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  final Function(String) onAnswerSelected;

  const QuestionScreen({
    required this.question,
    required this.onAnswerSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            question.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ...question.possibleAnswers.map((answer) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 63, 167, 251),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                ),
                onPressed: () => onAnswerSelected(answer),
                child: Text(answer),
              ),
            );
          }),
        ],
      ),
    );
  }
}
