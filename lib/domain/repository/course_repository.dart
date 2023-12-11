import 'package:application_edspert/domain/entity/course/course_question_response_entity.dart';
import 'package:application_edspert/domain/entity/course/course_response_entity.dart';
import 'package:application_edspert/domain/entity/course/course_result_response_entity.dart';

import '../../data/models/course/course_answer_request_model.dart';
import '../entity/course/course_exercise_response_entity.dart';

abstract class CourseRepository {
  // CourseList
  Future<List<CourseDataEntity>?> getCourses(String majorName);

  // CourseExerciseList
  Future<List<CourseExerciseDataEntity>?> getCourseExercisesByCourseId(
      String courseId);

  // Do Exercise
  Future<List<CourseQuestionDataEntity>?> getCourseQuestionByExerciseId(
      String exerciseId);

  Future<bool?> submitQuestionAnswer(CourseAnswerRequestModel request);

  Future<CourseResultResponseEntity?> getCourseResult(String exerciseId);
}
