// To parse this JSON data, do
//
//     final courseResultResponseModel = courseResultResponseModelFromJson(jsonString);

import 'dart:convert';

CourseResultResponseModel courseResultResponseModelFromJson(String str) => CourseResultResponseModel.fromJson(json.decode(str));

String courseResultResponseModelToJson(CourseResultResponseModel data) => json.encode(data.toJson());

class CourseResultResponseModel {
    int? status;
    String? message;
    CourseResultDataModel? data;

    CourseResultResponseModel({
        this.status,
        this.message,
        this.data,
    });

    factory CourseResultResponseModel.fromJson(Map<String, dynamic> json) => CourseResultResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : CourseResultDataModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class CourseResultDataModel {
    CourseResultExerciseModel? exercise;
    CourseResultValueModel? result;

    CourseResultDataModel({
        this.exercise,
        this.result,
    });

    factory CourseResultDataModel.fromJson(Map<String, dynamic> json) => CourseResultDataModel(
        exercise: json["exercise"] == null ? null : CourseResultExerciseModel.fromJson(json["exercise"]),
        result: json["result"] == null ? null : CourseResultValueModel.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "exercise": exercise?.toJson(),
        "result": result?.toJson(),
    };
}

class CourseResultExerciseModel {
    String? exerciseId;
    String? exerciseCode;
    String? fileCourse;
    String? icon;
    String? exerciseTitle;
    String? exerciseDescription;
    String? exerciseInstruction;
    String? countQuestion;
    String? classFk;
    String? courseFk;
    String? courseContentFk;
    String? subCourseContentFk;
    String? creatorId;
    String? creatorName;
    String? examFrom;
    String? accessType;
    String? exerciseOrder;
    String? exerciseStatus;
    DateTime? dateCreate;
    DateTime? dateUpdate;

    CourseResultExerciseModel({
        this.exerciseId,
        this.exerciseCode,
        this.fileCourse,
        this.icon,
        this.exerciseTitle,
        this.exerciseDescription,
        this.exerciseInstruction,
        this.countQuestion,
        this.classFk,
        this.courseFk,
        this.courseContentFk,
        this.subCourseContentFk,
        this.creatorId,
        this.creatorName,
        this.examFrom,
        this.accessType,
        this.exerciseOrder,
        this.exerciseStatus,
        this.dateCreate,
        this.dateUpdate,
    });

    factory CourseResultExerciseModel.fromJson(Map<String, dynamic> json) => CourseResultExerciseModel(
        exerciseId: json["exercise_id"],
        exerciseCode: json["exercise_code"],
        fileCourse: json["file_course"],
        icon: json["icon"],
        exerciseTitle: json["exercise_title"],
        exerciseDescription: json["exercise_description"],
        exerciseInstruction: json["exercise_instruction"],
        countQuestion: json["count_question"],
        classFk: json["class_fk"],
        courseFk: json["course_fk"],
        courseContentFk: json["course_content_fk"],
        subCourseContentFk: json["sub_course_content_fk"],
        creatorId: json["creator_id"],
        creatorName: json["creator_name"],
        examFrom: json["exam_from"],
        accessType: json["access_type"],
        exerciseOrder: json["exercise_order"],
        exerciseStatus: json["exercise_status"],
        dateCreate: json["date_create"] == null ? null : DateTime.parse(json["date_create"]),
        dateUpdate: json["date_update"] == null ? null : DateTime.parse(json["date_update"]),
    );

    Map<String, dynamic> toJson() => {
        "exercise_id": exerciseId,
        "exercise_code": exerciseCode,
        "file_course": fileCourse,
        "icon": icon,
        "exercise_title": exerciseTitle,
        "exercise_description": exerciseDescription,
        "exercise_instruction": exerciseInstruction,
        "count_question": countQuestion,
        "class_fk": classFk,
        "course_fk": courseFk,
        "course_content_fk": courseContentFk,
        "sub_course_content_fk": subCourseContentFk,
        "creator_id": creatorId,
        "creator_name": creatorName,
        "exam_from": examFrom,
        "access_type": accessType,
        "exercise_order": exerciseOrder,
        "exercise_status": exerciseStatus,
        "date_create": dateCreate?.toIso8601String(),
        "date_update": dateUpdate?.toIso8601String(),
    };
}

class CourseResultValueModel {
    String? jumlahBenar;
    String? jumlahSalah;
    String? jumlahTidak;
    String? jumlahScore;

    CourseResultValueModel({
        this.jumlahBenar,
        this.jumlahSalah,
        this.jumlahTidak,
        this.jumlahScore,
    });

    factory CourseResultValueModel.fromJson(Map<String, dynamic> json) => CourseResultValueModel(
        jumlahBenar: json["jumlah_benar"],
        jumlahSalah: json["jumlah_salah"],
        jumlahTidak: json["jumlah_tidak"],
        jumlahScore: json["jumlah_score"],
    );

    Map<String, dynamic> toJson() => {
        "jumlah_benar": jumlahBenar,
        "jumlah_salah": jumlahSalah,
        "jumlah_tidak": jumlahTidak,
        "jumlah_score": jumlahScore,
    };
}
