import 'package:application_edspert/domain/entity/course/course_exercise_response_entity.dart';

import '../../repository/course_repository.dart';

class GetExerciseByCourseIdUsecase {
  final CourseRepository repository;

  const GetExerciseByCourseIdUsecase({required this.repository});

  Future<List<CourseExerciseDataEntity>?> call(String courseId) async =>
      await repository.getCourseExercisesByCourseId(courseId);
}
