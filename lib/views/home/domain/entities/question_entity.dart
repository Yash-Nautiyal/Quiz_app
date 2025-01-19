import 'package:equatable/equatable.dart';

class QuestionEntity extends Equatable {
  final String description;
  final String detailedSol;
  final List<OptionEntity> options;

  const QuestionEntity({
    required this.description,
    required this.detailedSol,
    required this.options,
  });

  @override
  List<Object?> get props => [
        description,
        detailedSol,
        options,
      ];
}

class OptionEntity extends Equatable {
  final String description;
  final bool isCorrect;

  const OptionEntity({
    required this.description,
    required this.isCorrect,
  });
  @override
  List<Object?> get props => [
        description,
        isCorrect,
      ];
}
