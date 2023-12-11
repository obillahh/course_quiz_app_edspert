import '../../entity/course/course_question_response_entity.dart';
import '../../repository/course_repository.dart';

class GetQuestionByExerciseIdUsecase {
  final CourseRepository repository;

  const GetQuestionByExerciseIdUsecase({required this.repository});

  Future<List<CourseQuestionDataEntity>?> call(String exerciseId) async =>
      await repository.getCourseQuestionByExerciseId(exerciseId);
}
