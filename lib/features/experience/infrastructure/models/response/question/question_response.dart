import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';
import 'package:seedly_app/features/experience/applications/entities/question/question_entities.dart';

part 'question_response.g.dart';

@JsonSerializable()
class QuestionResponse implements ResponseMapper<QuestionEntity> {
  final String questionId;
  final String difficulty;
  final String question;
  final List<QuestionOptionResponse> options;
  final int xpReward;
  final int? cooldownRemainingSeconds;

  const QuestionResponse({
    required this.questionId,
    required this.difficulty,
    required this.question,
    required this.options,
    required this.xpReward,
    this.cooldownRemainingSeconds,
  });

  factory QuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionResponseToJson(this);

  @override
  QuestionEntity toDomain() => QuestionEntity(
    questionId: questionId,
    difficulty: difficulty,
    question: question,
    options: options.map((e) => e.toDomain()).toList(),
    xpReward: xpReward,
    cooldownRemainingSeconds: cooldownRemainingSeconds,
  );
}

@JsonSerializable()
class QuestionOptionResponse implements ResponseMapper<QuestionOptionEntity> {
  final String key;
  final String text;

  const QuestionOptionResponse({required this.key, required this.text});

  factory QuestionOptionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionOptionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionOptionResponseToJson(this);

  @override
  QuestionOptionEntity toDomain() => QuestionOptionEntity(key: key, text: text);
}
