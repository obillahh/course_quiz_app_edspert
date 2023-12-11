part of 'result_bloc.dart';

@immutable
sealed class ResultEvent {}

class GetCourseResultEvent extends ResultEvent {
  final String exerciseId;

  GetCourseResultEvent({required this.exerciseId});
}
