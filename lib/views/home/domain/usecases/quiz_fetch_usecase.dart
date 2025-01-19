import 'package:brainstock/views/home/domain/repositories/domain_quiz_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/quiz_entity.dart';

class QuizFetchUsecase {
  final DomainQuizRepository repository;

  QuizFetchUsecase({required this.repository});

  Future<Either<Exception, QuizEntity>> call() async {
    return await repository.fetchQuiz();
  }
}
