import 'package:equatable/equatable.dart';
import 'package:garant_test/features/quiz/data/models/option_model.dart';
import 'package:json_annotation/json_annotation.dart';

class OptionEntity extends Equatable {
  final String title;
  final String content;

  const OptionEntity({
    this.title = "",
    this.content = "",
  });

  @override
  List<Object?> get props => [title, content];
}

class OptionEntityConverter
    extends JsonConverter<OptionEntity, Map<String, dynamic>> {
  @override
  OptionEntity fromJson(Map<String, dynamic> json) =>
      OptionModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(OptionEntity object) => {};

  const OptionEntityConverter();
}
