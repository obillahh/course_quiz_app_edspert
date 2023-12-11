part of 'answer_bloc.dart';

@immutable
sealed class AnswerState {}

final class AnswerInitial extends AnswerState {}

final class AnswerLoading extends AnswerState {}

final class AnswerSuccess extends AnswerState {
  final bool? submit;

  AnswerSuccess({required this.submit});
}

final class AnswerFail extends AnswerState {
  final String message;

  AnswerFail({required this.message});
}
