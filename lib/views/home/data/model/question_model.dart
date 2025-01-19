import 'package:equatable/equatable.dart';

import '../../domain/entities/question_entity.dart';

class QuestionModel extends Equatable {
  final String description;
  final String detailedSol;
  final List<OptionModel> options;

  const QuestionModel({
    required this.description,
    required this.detailedSol,
    required this.options,
  });

  @override
  List<Object?> get props => [
        description,
        detailedSol,
      ];
}

class OptionModel extends Equatable {
  final String description;
  final bool isCorrect;
  const OptionModel({required this.description, required this.isCorrect});

  @override
  List<Object?> get props => [
        description,
        isCorrect,
      ];
}

extension OptionModelX on OptionModel {
  OptionEntity toEntity() {
    return OptionEntity(
      description: description,
      isCorrect: isCorrect,
    );
  }
}

extension QuestionModelX on QuestionModel {
  QuestionEntity toEntity() {
    return QuestionEntity(
      description: description,
      detailedSol: detailedSol,
      options: options
          .map((opt) => opt.toEntity())
          .toList(), // Correctly map options
    );
  }
}
