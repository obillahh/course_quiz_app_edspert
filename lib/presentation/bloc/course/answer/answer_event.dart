part of 'answer_bloc.dart';

@immutable
sealed class AnswerEvent {}

class SubmitAnswerEvent extends AnswerEvent {
  final CourseAnswerRequestModel request;

  SubmitAnswerEvent({required this.request});
}
