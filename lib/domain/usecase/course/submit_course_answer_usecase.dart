import 'package:application_edspert/data/models/course/course_answer_request_model.dart';
import '../../repository/course_repository.dart';

class SubmitCourseAnswerUsecase {
  final CourseRepository repository;

  const SubmitCourseAnswerUsecase({required this.repository});

  Future<bool?> call(CourseAnswerRequestModel request) async =>
      await repository.submitQuestionAnswer(request);
}
