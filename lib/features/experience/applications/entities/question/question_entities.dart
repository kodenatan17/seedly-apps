import 'package:equatable/equatable.dart';

/// Difficulty-adapted MCQ question (`GET /v1/plants/:id/questions`).
///
/// Spec is explicit: the correct answer / partial-credit keys are never
/// returned here — scoring happens server-side only (see
/// `SubmitQuestionAnswerUseCase`).
class QuestionEntity extends Equatable {
  const QuestionEntity({
    required this.questionId,
    required this.difficulty,
    required this.question,
    required this.options,
    required this.xpReward,
    this.cooldownRemainingSeconds,
  });

  final String questionId;

  /// One of `EASY|MEDIUM|ADVANCED`.
  final String difficulty;
  final String question;
  final List<QuestionOptionEntity> options;
  final int xpReward;

  /// Null when the question isn't on the 24h re-answer cooldown.
  final int? cooldownRemainingSeconds;

  @override
  List<Object?> get props => [
    questionId,
    difficulty,
    question,
    options,
    xpReward,
    cooldownRemainingSeconds,
  ];
}

class QuestionOptionEntity extends Equatable {
  const QuestionOptionEntity({required this.key, required this.text});

  final String key;
  final String text;

  @override
  List<Object?> get props => [key, text];
}

/// Result of submitting an MCQ answer
/// (`POST /v1/plants/:id/questions/:questionId/answer`).
class QuestionAnswerResultEntity extends Equatable {
  const QuestionAnswerResultEntity({
    required this.result,
    required this.xpAwarded,
    required this.explanation,
    required this.correctAnswer,
  });

  /// One of `FULL|PARTIAL|INCORRECT`.
  final String result;
  final int xpAwarded;
  final String explanation;
  final String correctAnswer;

  @override
  List<Object?> get props => [result, xpAwarded, explanation, correctAnswer];
}
