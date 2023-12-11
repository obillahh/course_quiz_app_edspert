part of 'exercise_bloc.dart';

@immutable
sealed class ExerciseState {}

final class ExerciseInitial extends ExerciseState {}

final class CourseExerciseLoading extends ExerciseState {}

final class CourseExerciseSuccess extends ExerciseState {
  final List<CourseExerciseDataEntity>? courseExercises;

  CourseExerciseSuccess({required this.courseExercises});
}

final class CourseExerciseFail extends ExerciseState {
  final String message;

  CourseExerciseFail({required this.message});
}