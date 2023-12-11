import 'package:application_edspert/domain/entity/course/course_response_entity.dart';
import 'package:application_edspert/domain/repository/course_repository.dart';

class GetCoursesUsecase {
  final CourseRepository repository;

  const GetCoursesUsecase({required this.repository});

  Future<List<CourseDataEntity>?> call(String majorName) async =>
      await repository.getCourses(majorName);
}
