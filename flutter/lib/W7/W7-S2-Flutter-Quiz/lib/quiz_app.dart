import 'package:flutter/material.dart';
import 'model/quiz.dart';
import 'model/submission.dart';
import 'screens/welcome_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';

Color appColor = Colors.blue[500] as Color;

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

enum QuizScreen { welcome, question, result }

class _QuizAppState extends State<QuizApp> {
  QuizScreen _currentScreen = QuizScreen.welcome;
  int _currentQuestionIndex = 0;
  int _score = 0;

  void switchScreen(QuizScreen screen) {
    setState(() {
      _currentScreen = screen;
    });
  }

  void answerQuestion(String selectedAnswer) {
    setState(() {
      final currentQuestion = widget.quiz.questions[_currentQuestionIndex];
      if (selectedAnswer == currentQuestion.goodAnswer) {
        _score++;
      }
      if (_currentQuestionIndex < widget.quiz.questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        switchScreen(QuizScreen.result);
      }
    });
  }

  void restartQuiz() {
    setState(() {
      _currentScreen = QuizScreen.welcome;
      _currentQuestionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenContent;

    switch (_currentScreen) {
      case QuizScreen.welcome:
        screenContent = WelcomeScreen(
          onStart: () => switchScreen(QuizScreen.question),
        );
        break;
      case QuizScreen.question:
        screenContent = QuestionScreen(
          question: widget.quiz.questions[_currentQuestionIndex],
          onAnswerSelected: answerQuestion,
        );
        break;
      case QuizScreen.result:
        screenContent = ResultScreen(
          score: _score,
          totalQuestions: widget.quiz.questions.length,
          onRestart: restartQuiz,
          questions: widget.quiz.questions,
          submission: Submission(),
          quiz: widget.quiz,
        );
        break;
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: screenContent,
      ),
    );
  }
}
