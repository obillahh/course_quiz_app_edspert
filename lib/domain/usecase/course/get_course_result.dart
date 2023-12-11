import 'package:application_edspert/domain/entity/course/course_result_response_entity.dart';

import '../../repository/course_repository.dart';

class GetCourseResultUsecase {
  final CourseRepository repository;

  GetCourseResultUsecase({required this.repository});

  Future<CourseResultResponseEntity?> call(String exerciseId) async =>
      await repository.getCourseResult(exerciseId);
}
