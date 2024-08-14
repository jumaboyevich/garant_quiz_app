// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizModel _$QuizModelFromJson(Map<String, dynamic> json) => QuizModel(
      question: json['question'] as String? ?? "",
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => const OptionEntityConverter()
                  .fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      correctOption: json['correctOption'] as String? ?? "",
    );

Map<String, dynamic> _$QuizModelToJson(QuizModel instance) => <String, dynamic>{
      'question': instance.question,
      'options':
          instance.options.map(const OptionEntityConverter().toJson).toList(),
      'correctOption': instance.correctOption,
    };
