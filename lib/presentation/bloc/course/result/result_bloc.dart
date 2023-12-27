import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:application_edspert/domain/entity/course/course_result_response_entity.dart';
import 'package:application_edspert/domain/usecase/course/get_course_result_usecase.dart';

part 'result_event.dart';
part 'result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  final GetCourseResultUsecase getCourseResultUsecase;
  ResultBloc(this.getCourseResultUsecase) : super(ResultInitial()) {
    on<ResultEvent>(
      (event, emit) async {
        if (event is GetCourseResultEvent) {
          emit(ResultLoading());
          final CourseResultDataEntity? data =
              await getCourseResultUsecase(event.exerciseId);
          if (data == null) {
            emit(ResultFail(message: 'Something went wrong!'));
          } else {
            print('ResultSuccess: $data');
            emit(ResultSuccess(courseResult: data));
          }
        }
      },
    );
  }
}
