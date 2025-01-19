import 'package:brainstock/views/home/data/model/question_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/entities/question_entity.dart';
import '../../domain/entities/quiz_entity.dart';
import '../../domain/repositories/domain_quiz_repository.dart';
import '../sources/remote_data_sources.dart';

class QuizDataRepositoryImpl implements DomainQuizRepository {
  final QuizRemoteDataSource remoteDataSource;

  QuizDataRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Exception, QuizEntity>> fetchQuiz() async {
    try {
      final quiz = await remoteDataSource.fetchQuiz();
      final List<QuestionEntity> questions =
          quiz.questions.map((q) => q.toEntity()).toList();
      final quizEntity = QuizEntity(
          id: quiz.id, // Map fields correctly
          title: quiz.title,
          time: quiz.time,
          topic: quiz.topic,
          endTime: quiz.endTime,
          questionsCount: quiz.questionsCount,
          correctAnswerMarks: quiz.correctAnswerMarks,
          negativeMarks: quiz.negativeMarks,
          questionEntity: questions);
      print(questions.length);
      return Right(quizEntity);
    } catch (e) {
      print(e);
      return Left(Exception("Failed to fetch quiz due to $e"));
    }
  }
}
