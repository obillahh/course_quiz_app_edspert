import 'package:application_edspert/domain/usecase/course/submit_course_answer_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/course/course_answer_request_model.dart';

part 'answer_event.dart';
part 'answer_state.dart';

class AnswerBloc extends Bloc<AnswerEvent, AnswerState> {
  final SubmitCourseAnswerUsecase submitRequest;
  AnswerBloc(this.submitRequest) : super(AnswerInitial()) {
    on<AnswerEvent>(
      (event, emit) async {
        if (event is SubmitAnswerEvent) {
          emit(AnswerLoading());
          final bool? data = await submitRequest(event.request);
          if (data == false) {
            emit(AnswerFail(message: 'Something went wrong!'));
          } else {
            emit(AnswerSuccess(submit: data));
          }
        }
      },
    );
  }
}
