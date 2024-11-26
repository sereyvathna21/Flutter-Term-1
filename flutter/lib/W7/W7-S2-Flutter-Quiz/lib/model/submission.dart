class Answer {
  final String questionAnswer;

  Answer({required this.questionAnswer});

  bool isCorrect(Question question) {
    return question.goodAnswer == questionAnswer;
  }
}

class Question {
  final String goodAnswer;

  Question({required this.goodAnswer});
}

class Submission {
  final Map<Question, Answer> _answers = {};

  int getScore() {
    int score = 0;
    for (Question q in _answers.keys) {
      Answer answer = _answers[q]!;
      score += answer.isCorrect(q) ? 1 : 0;
    }
    return score;
  }

  Answer? getAnswerFor(Question question) {
    return _answers[question];
  }

  void addAnswer(Question question, String answerText) {
    _answers[question] = Answer(questionAnswer: answerText);
  }

  void removeAnswers() {
    _answers.clear();
  }
}
