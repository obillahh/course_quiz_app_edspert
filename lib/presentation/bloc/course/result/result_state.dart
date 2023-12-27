part of 'result_bloc.dart';

@immutable
sealed class ResultState {}

final class ResultInitial extends ResultState {}

final class ResultLoading extends ResultState {}

final class ResultSuccess extends ResultState {
  final CourseResultDataEntity courseResult;

  ResultSuccess({required this.courseResult});
}

final class ResultFail extends ResultState {
  final String message;

  ResultFail({required this.message});
}
