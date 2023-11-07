import 'package:milestone_2/data/repository/quiz_repository_impl.dart';

import '../../domain/quiz_repository.dart';

class RepositoryModule {
  static RepositoryQuiz quizRepository() => RepositoryQuizImpl();
}
