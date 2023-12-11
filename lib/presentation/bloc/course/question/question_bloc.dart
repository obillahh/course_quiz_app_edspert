import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entity/course/course_question_response_entity.dart';
import '../../../../domain/usecase/course/get_question_by_exercise_id.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final GetQuestionByExerciseIdUsecase getQuestionByExerciseIdUsecase;

  QuestionBloc(this.getQuestionByExerciseIdUsecase) : super(QuestionInitial()) {
    on<QuestionEvent>((event, emit) async {
      if (event is GetQuestionByExerciseIdEvent) {
          emit(CourseQuestionLoading());
          final List<CourseQuestionDataEntity>? data =
              await getQuestionByExerciseIdUsecase(
            event.exerciseId,
          );
          if (data == null) {
            emit(CourseQuestionFail(message: 'Something went wrong!'));
          } else {
            emit(CourseQuestionSuccess(courseQuestion: data));
          }
        }
    });
  }
}
