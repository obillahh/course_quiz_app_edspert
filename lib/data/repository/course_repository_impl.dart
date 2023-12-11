import 'package:application_edspert/data/datasource/remote/course_remote_datasource.dart';
import 'package:application_edspert/data/models/course/course_answer_request_model.dart';
import 'package:application_edspert/data/models/course/course_response_model.dart';
import 'package:application_edspert/domain/entity/course/course_exercise_response_entity.dart';
import 'package:application_edspert/domain/entity/course/course_question_response_entity.dart';
import 'package:application_edspert/domain/entity/course/course_result_response_entity.dart';
import 'package:application_edspert/domain/repository/course_repository.dart';
import 'package:dio/dio.dart';

import '../../domain/entity/course/course_response_entity.dart';
import '../models/course/course_exercise_response_model.dart';
import '../models/course/course_question_response_model.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseRemoteDatasource remoteDatasource;
  CourseRepositoryImpl({required this.remoteDatasource});

  static final Dio dio = Dio();

  @override
  Future<List<CourseDataEntity>?> getCourses(String majorName) async {
    final response = await remoteDatasource.getCourses(majorName);
    if (response.data == null) {
      return null;
    }
    final data = CourseResponseEntity(
      status: response.status ?? -1,
      message: response.message ?? '',
      data: List<CourseDataModel>.from(response.data ?? [])
          .map(
            (e) => CourseDataEntity(
              courseId: e.courseId ?? '',
              majorName: e.majorName ?? '',
              courseCategory: e.courseCategory ?? '',
              courseName: e.courseName ?? '',
              urlCover: e.urlCover ?? '',
              jumlahMateri: e.jumlahMateri ?? 0,
              jumlahDone: e.jumlahDone ?? 0,
              progress: e.progress ?? 0,
            ),
          )
          .toList(),
    );

    return data.data;
  }

  @override
  Future<List<CourseExerciseDataEntity>?> getCourseExercisesByCourseId(
      String courseId) async {
    final response =
        await remoteDatasource.getCourseExercisesByCourseId(courseId);
    if (response.data == null) {
      return null;
    }
    final data = CourseExerciseResponseEntity(
      status: response.status ?? -1,
      message: response.message ?? '',
      data: List<CourseExerciseDataModel>.from(response.data ?? [])
          .map(
            (e) => CourseExerciseDataEntity(
              exerciseId: e.exerciseId ?? '',
              exerciseTitle: e.exerciseTitle ?? '',
              accessType: e.accessType ?? '',
              icon: e.icon ?? '',
              exerciseUserStatus: e.exerciseUserStatus ?? '',
              jumlahSoal: e.jumlahSoal ?? '',
              jumlahDone: e.jumlahDone ?? 0,
            ),
          )
          .toList(),
    );
    return data.data;
  }

  @override
  Future<List<CourseQuestionDataEntity>?> getCourseQuestionByExerciseId(
      String exerciseId) async {
    final response =
        await remoteDatasource.getCourseQuestionByExerciseId(exerciseId);
    if (response.data == null) {
      return null;
    }
    final data = CourseQuestionResponseEntity(
      status: response.status ?? -1,
      message: response.message ?? '',
      data: List<CourseQuestionDataModel>.from(response.data ?? [])
          .map(
            (e) => CourseQuestionDataEntity(
              exerciseIdFk: e.exerciseIdFk ?? '',
              bankQuestionId: e.bankQuestionId ?? '',
              questionTitle: e.questionTitle ?? '',
              questionTitleImg: e.questionTitleImg ?? '',
              optionA: e.optionA ?? '',
              optionAImg: e.optionAImg ?? '',
              optionB: e.optionB ?? '',
              optionBImg: e.optionBImg ?? '',
              optionC: e.optionC ?? '',
              optionCImg: e.optionCImg ?? '',
              optionD: e.optionD ?? '',
              optionDImg: e.optionDImg ?? '',
              optionE: e.optionE ?? '',
              optionEImg: e.optionEImg ?? '',
              studentAnswer: e.studentAnswer ?? '',
            ),
          )
          .toList(),
    );
    return data.data;
  }

  @override
  Future<bool> submitQuestionAnswer(CourseAnswerRequestModel request) async {
    final result = await remoteDatasource.submitQuestionAnswer(request);
    return result;
  }

  @override
  Future<CourseResultResponseEntity?> getCourseResult(String exerciseId) async {
    final response = await remoteDatasource.getCourseResult(exerciseId);
    if (response.data == null) {
      return null;
    }
    final data = CourseResultResponseEntity(
      status: response.status ?? -1,
      message: response.message ?? '',
      data: CourseResultDataEntity(
        exercise: CourseResultExerciseEntity(
          exerciseId: response.data?.exercise?.exerciseId ?? '',
          exerciseCode: response.data?.exercise?.exerciseCode ?? '',
          fileCourse: response.data?.exercise?.fileCourse ?? '',
          icon: response.data?.exercise?.icon ?? '',
          exerciseTitle: response.data?.exercise?.exerciseTitle ?? '',
          exerciseDescription:
              response.data?.exercise?.exerciseDescription ?? '',
          exerciseInstruction:
              response.data?.exercise?.exerciseInstruction ?? '',
          countQuestion: response.data?.exercise?.countQuestion ?? '',
          classFk: response.data?.exercise?.classFk ?? '',
          courseFk: response.data?.exercise?.courseFk ?? '',
          courseContentFk: response.data?.exercise?.courseContentFk ?? '',
          subCourseContentFk: response.data?.exercise?.subCourseContentFk ?? '',
          creatorId: response.data?.exercise?.creatorId ?? '',
          creatorName: response.data?.exercise?.creatorName ?? '',
          examFrom: response.data?.exercise?.examFrom ?? '',
          accessType: response.data?.exercise?.accessType ?? '',
          exerciseOrder: response.data?.exercise?.exerciseOrder ?? '',
          exerciseStatus: response.data?.exercise?.exerciseStatus ?? '',
          dateCreate: response.data?.exercise?.dateCreate ?? DateTime.now(),
          dateUpdate: response.data?.exercise?.dateUpdate ?? DateTime.now(),
        ),
        result: CourseResultValueEntity(
          jumlahBenar: response.data?.result?.jumlahBenar ?? '',
          jumlahSalah: response.data?.result?.jumlahSalah ?? '',
          jumlahTidak: response.data?.result?.jumlahTidak ?? '',
          jumlahScore: response.data?.result?.jumlahScore ?? '',
        ),
      ),
    );
    return data;
  }
}
