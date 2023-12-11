part of 'course_bloc.dart';

@immutable
sealed class CourseState {}

final class CourseInitial extends CourseState {}

final class CourseLoading extends CourseState {}

final class CourseSuccess extends CourseState {
  final List<CourseDataEntity>? courses;

  CourseSuccess({required this.courses});
}

final class CourseFail extends CourseState {
  final String message;

  CourseFail({required this.message});
}

