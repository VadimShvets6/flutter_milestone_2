import 'package:milestone_2/data/repository/repository_module.dart';
import 'package:milestone_2/domain/models/quiz.dart';
import 'package:milestone_2/domain/quiz_repository.dart';

class GetQuizUseCase {
  final RepositoryQuiz _repositoryQuiz = RepositoryModule.quizRepository();

  Quiz getQuiz() {
    return _repositoryQuiz.getQuiz();
  }
}
