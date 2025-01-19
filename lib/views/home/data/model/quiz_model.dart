import 'package:brainstock/views/home/data/model/question_model.dart';
import 'package:equatable/equatable.dart';

class QuizModel extends Equatable {
  final int id;
  final String? name;
  final String title;
  final String topic;
  final String time;
  final String endTime;
  final double correctAnswerMarks;
  final double negativeMarks;
  final int questionsCount;
  final List<QuestionModel> questions;

  const QuizModel(
      {required this.id,
      this.name,
      required this.title,
      required this.topic,
      required this.time,
      required this.endTime,
      required this.correctAnswerMarks,
      required this.negativeMarks,
      required this.questionsCount,
      required this.questions});

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      id: json['id'],
      name: json['name'],
      title: json['title'] ?? "Unknown",
      topic: json['topic'] ?? "Unknown",
      time: json['time'],
      endTime: json['end_time'],
      correctAnswerMarks: double.parse(json['correct_answer_marks'].toString()),
      negativeMarks: double.parse(json['negative_marks'].toString()),
      questionsCount: json['questions_count'],
      questions: (json['questions'] as List<dynamic>)
          .map(
            (question) => QuestionModel(
              description: question['description'] ?? "",
              detailedSol: question['detailedSol'] ?? "",
              options: (question['options'] as List<dynamic>)
                  .map(
                    (option) => OptionModel(
                      description: option['description'] ?? "",
                      isCorrect: option['is_correct'] ?? "",
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        topic,
        time,
        endTime,
        correctAnswerMarks,
        negativeMarks,
        questionsCount,
        questions
      ];
}
