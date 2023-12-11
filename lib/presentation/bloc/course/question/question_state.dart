part of 'question_bloc.dart';

@immutable
sealed class QuestionState {}

final class QuestionInitial extends QuestionState {}

final class CourseQuestionLoading extends QuestionState {}

final class CourseQuestionSuccess extends QuestionState {
  final List<CourseQuestionDataEntity>? courseQuestion;

  CourseQuestionSuccess({required this.courseQuestion});
}

final class CourseQuestionFail extends QuestionState {
  final String message;

  CourseQuestionFail({required this.message});
}
