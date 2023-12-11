import 'package:application_edspert/domain/entity/course/course_response_entity.dart';
import 'package:application_edspert/domain/usecase/course/get_courses_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetCoursesUsecase getCourseUsecase;
  CourseBloc(
    this.getCourseUsecase,
  ) : super(CourseInitial()) {
    on<CourseEvent>(
      (event, emit) async {
        if (event is GetCoursesEvent) {
          emit(CourseLoading());
          final List<CourseDataEntity>? data =
              await getCourseUsecase(event.majorName);
          if (data == null) {
            emit(CourseFail(message: 'Something went wrong!'));
          } else {
            emit(CourseSuccess(courses: data));
          }
        }
      },
    );
  }
}
