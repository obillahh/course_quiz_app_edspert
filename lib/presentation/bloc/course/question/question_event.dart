part of 'question_bloc.dart';

@immutable
sealed class QuestionEvent {}

class GetQuestionByExerciseIdEvent extends QuestionEvent {
  final String exerciseId;

  GetQuestionByExerciseIdEvent({required this.exerciseId});
}
