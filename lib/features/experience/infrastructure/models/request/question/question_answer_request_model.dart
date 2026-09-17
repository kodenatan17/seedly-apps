import 'package:json_annotation/json_annotation.dart';

part 'question_answer_request_model.g.dart';

@JsonSerializable()
class QuestionAnswerRequestModel {
  final String answer;

  const QuestionAnswerRequestModel({required this.answer});

  factory QuestionAnswerRequestModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionAnswerRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionAnswerRequestModelToJson(this);
}
