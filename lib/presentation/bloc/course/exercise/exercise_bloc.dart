import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entity/course/course_exercise_response_entity.dart';
import '../../../../domain/usecase/course/get_exercise_by_course_id_usecase.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final GetExerciseByCourseIdUsecase getExerciseByCourseIdUsecase;
  ExerciseBloc(this.getExerciseByCourseIdUsecase) : super(ExerciseInitial()) {
    on<ExerciseEvent>(
      (event, emit) async {
        if (event is GetExerciseByCourseIdEvent) {
          emit(CourseExerciseLoading());
          final List<CourseExerciseDataEntity>? data =
              await getExerciseByCourseIdUsecase(event.courseId);
          if (data == null) {
            emit(CourseExerciseFail(message: 'Something went wrong!'));
          } else {
            emit(CourseExerciseSuccess(courseExercises: data));
          }
        }
      },
    );
  }
}
