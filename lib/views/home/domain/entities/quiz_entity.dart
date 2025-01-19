import 'package:brainstock/views/home/domain/entities/question_entity.dart';
import 'package:equatable/equatable.dart';

class QuizEntity extends Equatable {
  final int id;
  final String title;
  final String topic;
  final String time;
  final String endTime;
  final int questionsCount;
  final double correctAnswerMarks;
  final double negativeMarks;
  final List<QuestionEntity> questionEntity;

  const QuizEntity(
      {required this.id,
      required this.title,
      required this.topic,
      required this.time,
      required this.endTime,
      required this.questionsCount,
      required this.correctAnswerMarks,
      required this.negativeMarks,
      required this.questionEntity});

  @override
  List<Object?> get props => [
        id,
        title,
        topic,
        time,
        endTime,
        questionsCount,
        correctAnswerMarks,
        negativeMarks,
        questionEntity
      ];
}
