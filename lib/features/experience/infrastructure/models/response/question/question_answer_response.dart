import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';
import 'package:seedly_app/features/experience/applications/entities/question/question_entities.dart';

part 'question_answer_response.g.dart';

@JsonSerializable()
class QuestionAnswerResponse
    implements ResponseMapper<QuestionAnswerResultEntity> {
  final String result;
  final int xpAwarded;
  final String explanation;
  final String correctAnswer;

  const QuestionAnswerResponse({
    required this.result,
    required this.xpAwarded,
    required this.explanation,
    required this.correctAnswer,
  });

  factory QuestionAnswerResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionAnswerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionAnswerResponseToJson(this);

  @override
  QuestionAnswerResultEntity toDomain() => QuestionAnswerResultEntity(
    result: result,
    xpAwarded: xpAwarded,
    explanation: explanation,
    correctAnswer: correctAnswer,
  );
}
