import 'package:garant_test/features/quiz/domain/entities/option_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'option_model.g.dart';

@JsonSerializable()
class OptionModel extends OptionEntity {
  const OptionModel({
    super.title,
    super.content,
  });

  OptionEntity toEntity() => OptionEntity(content: content, title: title);

  factory OptionModel.fromJson(Map<String, dynamic> json) =>
      _$OptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$OptionModelToJson(this);
}
