import 'package:garant_test/features/quiz/domain/entities/option_entity.dart';
import 'package:garant_test/features/quiz/domain/entities/quiz_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quiz_model.g.dart';

@JsonSerializable()
class QuizModel extends QuizEntity {
  const QuizModel({super.question, super.options, super.correctOption});

  QuizEntity toEntity() => QuizEntity(
      correctOption: correctOption, options: options, question: question);
  factory QuizModel.fromJson(Map<String, dynamic> json) =>
      _$QuizModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuizModelToJson(this);
}
