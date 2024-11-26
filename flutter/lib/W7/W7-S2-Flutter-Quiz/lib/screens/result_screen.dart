import 'package:flutter/material.dart';

import '../model/quiz.dart';
import '../model/submission.dart';
import '../widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.onRestart,
    required this.submission,
    required this.quiz,
    required int score,
    required int totalQuestions,
    required List questions,
  });

  final VoidCallback onRestart;
  final Submission submission;
  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    final score = submission.getScore();
    final totalQuestions = quiz.questions.length;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "You answered $score out of $totalQuestions!",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: quiz.questions.length,
                itemBuilder: (context, index) {
                  final question = quiz.questions[index];
                  return Correction(
                    questionIndex: index + 1,
                    quizTitle: question.title,
                    answers: question.possibleAnswers,
                    correctAnswer: question.goodAnswer,
                    userAnswer: '',
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            AppButton(
              "Restart Quiz",
              onTap: onRestart,
              icon: Icons.restart_alt,
            ),
          ],
        ),
      ),
    );
  }
}

class Correction extends StatelessWidget {
  const Correction({
    super.key,
    required this.quizTitle,
    required this.questionIndex,
    required this.answers,
    required this.correctAnswer,
    required this.userAnswer,
  });

  final int questionIndex;
  final String quizTitle;
  final List<String> answers;
  final String correctAnswer;
  final String userAnswer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor:
                    userAnswer == correctAnswer ? Colors.green : Colors.red,
                child: Text(
                  "$questionIndex",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  quizTitle,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: answers.map((textAnswer) {
              final isCorrect = textAnswer == correctAnswer;
              final isUserAnswer = textAnswer == userAnswer;

              return Row(
                children: [
                  Icon(
                    isUserAnswer
                        ? (isCorrect ? Icons.check : Icons.close)
                        : Icons.circle,
                    color: isCorrect
                        ? Colors.green
                        : (isUserAnswer ? Colors.red : Colors.grey),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    textAnswer,
                    style: TextStyle(
                      fontSize: 16,
                      color: isCorrect
                          ? Colors.green
                          : (isUserAnswer ? Colors.red : Colors.black),
                      fontWeight: isUserAnswer || isCorrect
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
          const Divider(color: Colors.white),
        ],
      ),
    );
  }
}
