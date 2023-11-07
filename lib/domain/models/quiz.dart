class Question {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
  });
}

class Quiz {
  final List<Question> questions;
  final int totalQuestions;
  final int timeLimit;

  Quiz({
    required this.questions,
    required this.totalQuestions,
    required this.timeLimit,
  });
}

class QuizResult {
  int rating;
  int score;
  int maxScore;
  int correctAnswers;
  int timeCompleted;
  int totalAnswers;

  QuizResult({
    required this.rating,
    required this.score,
    required this.maxScore,
    required this.correctAnswers,
    required this.timeCompleted,
    required this.totalAnswers
  });
}
