part of 'exercise_bloc.dart';

@immutable
sealed class ExerciseEvent {}

class GetExerciseByCourseIdEvent extends ExerciseEvent {
  final String courseId;

  GetExerciseByCourseIdEvent({required this.courseId});
}
