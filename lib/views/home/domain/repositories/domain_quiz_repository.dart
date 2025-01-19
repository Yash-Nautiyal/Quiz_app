import 'package:fpdart/fpdart.dart';

import '../entities/quiz_entity.dart';

abstract class DomainQuizRepository {
  Future<Either<Exception, QuizEntity>> fetchQuiz();
}
