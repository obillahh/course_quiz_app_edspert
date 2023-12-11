import 'dart:developer';

import 'package:application_edspert/data/models/course/course_answer_request_model.dart';
import 'package:application_edspert/data/models/course/course_question_response_model.dart';
import 'package:application_edspert/data/models/course/course_response_model.dart';
import 'package:application_edspert/data/models/course/course_result_response_model.dart';
import 'package:dio/dio.dart';

import '../../models/course/course_exercise_response_model.dart';

class CourseRemoteDatasource {
  final Dio client;
  const CourseRemoteDatasource({required this.client});

  Future<CourseResponseModel> getCourses(String majorName) async {
    try {
      const url = 'https://edspert.widyaedu.com/exercise/data_course';
      final result = await client.get(
        url,
        queryParameters: {
          "major_name": majorName,
          "user_email": "juveticsatu@gmail.com",
        },
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
      );
      final courseData = CourseResponseModel.fromJson(result.data);
      return courseData;
    } catch (e) {
      inspect('Error: $e');
      return CourseResponseModel();
    }
  }

  Future<CourseExerciseResponseModel> getCourseExercisesByCourseId(
    String courseId,
  ) async {
    try {
      const url = 'https://edspert.widyaedu.com/exercise/data_exercise';
      final result = await client.get(
        url,
        queryParameters: {
          'course_id': courseId,
          'user_email': 'juveticsatu@gmail.com',
        },
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
      );
      final courseExercise = CourseExerciseResponseModel.fromJson(result.data);
      return courseExercise;
    } catch (e) {
      inspect('Error: $e');
      return CourseExerciseResponseModel();
    }
  }

  Future<CourseQuestionResponseModel> getCourseQuestionByExerciseId(
      String exerciseId) async {
    try {
      const url = 'https://edspert.widyaedu.com/exercise/kerjakan';
      final result = await client.post(
        url,
        data: {
          'exercise_id': exerciseId,
          'user_email': 'juveticsatu@gmail.com',
        },
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
      );
      final courseQuestion = CourseQuestionResponseModel.fromJson(result.data);
      return courseQuestion;
    } catch (e) {
      inspect('Error: $e');
      return CourseQuestionResponseModel();
    }
  }

  Future<bool> submitQuestionAnswer(CourseAnswerRequestModel request) async {
    try {
      const String url = 'https://edspert.widyaedu.com/exercise/input_jawaban';
      final result = await client.post(url,
          data: request.toMap(),
          options: Options(
            headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
          ));
      inspect(result.data);
      if (result.data['message'] == 'Sukses input jawaban') {
        return true;
      }
      return false;
    } catch (e) {
      inspect('Error: $e');
      return false;
    }
  }

  Future<CourseResultResponseModel> getCourseResult(String exerciseId) async {
    try {
      const url = 'https://edspert.widyaedu.com/exercise/score_result';
      final result = await client.get(
        url,
        queryParameters: {
          'exercise_id': exerciseId,
          'user_email': 'juveticsatu@gmail.com',
        },
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
      );
      final courseResult = CourseResultResponseModel.fromJson(result.data);
      return courseResult;
    } catch (e) {
      inspect('Error: $e');
      return CourseResultResponseModel();
    }
  }
}
