// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:garant_test/assets/colors/colors.dart';
import 'package:garant_test/features/quiz/data/models/quiz_model.dart';
import 'package:garant_test/features/quiz/domain/entities/option_entity.dart';
import 'package:json_annotation/json_annotation.dart';

class QuizEntity extends Equatable {
  final String question;
  @OptionEntityConverter()
  final List<OptionEntity> options;
  final OptionEntity? selectedItem;
  final String correctOption;

  const QuizEntity(
      {this.question = "",
      this.options = const [],
      this.correctOption = "",
      this.selectedItem});

  bool get initialSelectedAnswer => selectedItem == null;

  Color get tabIndicatorColor {
    if (initialSelectedAnswer) {
      return white;
    }

    if (!isCorrectAnswer) {
      return flamingo;
    }
    return greenBlue;
  }

  Color optionsBackroundColor(OptionEntity item) {
    if (initialSelectedAnswer) {
      return white;
    }

    if (item == selectedItem) {
      return isCorrectAnswer ? greenHex00D856 : flamingo;
    }
    if (item.title == correctOption) {
      return greenHex00D856;
    }

    return white;
  }

  bool get isCorrectAnswer {
    if (initialSelectedAnswer) {
      return false;
    }

    if (selectedItem!.title != correctOption) {
      return false;
    }

    return true;
  }

  @override
  List<Object?> get props => [question, options];

  QuizEntity copyWith({
    String? question,
    List<OptionEntity>? options,
    OptionEntity? selectedItem,
    String? correctOption,
  }) {
    return QuizEntity(
      question: question ?? this.question,
      options: options ?? this.options,
      selectedItem: selectedItem ?? this.selectedItem,
      correctOption: correctOption ?? this.correctOption,
    );
  }
}

class QuizEntityConverter
    extends JsonConverter<QuizEntity, Map<String, dynamic>> {
  @override
  QuizEntity fromJson(Map<String, dynamic> json) => QuizModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(QuizEntity object) => {};

  const QuizEntityConverter();
}
