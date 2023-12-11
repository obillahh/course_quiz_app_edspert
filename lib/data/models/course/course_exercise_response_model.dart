// To parse this JSON data, do
//
//     final courseExerciseResponseModel = courseExerciseResponseModelFromJson(jsonString);

import 'dart:convert';

CourseExerciseResponseModel courseExerciseResponseModelFromJson(String str) => CourseExerciseResponseModel.fromJson(json.decode(str));

String courseExerciseResponseModelToJson(CourseExerciseResponseModel data) => json.encode(data.toJson());

class CourseExerciseResponseModel {
    int? status;
    String? message;
    List<CourseExerciseDataModel>? data;

    CourseExerciseResponseModel({
        this.status,
        this.message,
        this.data,
    });

    factory CourseExerciseResponseModel.fromJson(Map<String, dynamic> json) => CourseExerciseResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<CourseExerciseDataModel>.from(json["data"]!.map((x) => CourseExerciseDataModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class CourseExerciseDataModel {
    String? exerciseId;
    String? exerciseTitle;
    String? accessType;
    String? icon;
    String? exerciseUserStatus;
    String? jumlahSoal;
    int? jumlahDone;

    CourseExerciseDataModel({
        this.exerciseId,
        this.exerciseTitle,
        this.accessType,
        this.icon,
        this.exerciseUserStatus,
        this.jumlahSoal,
        this.jumlahDone,
    });

    factory CourseExerciseDataModel.fromJson(Map<String, dynamic> json) => CourseExerciseDataModel(
        exerciseId: json["exercise_id"],
        exerciseTitle: json["exercise_title"],
        accessType: json["access_type"],
        icon: json["icon"],
        exerciseUserStatus: json["exercise_user_status"],
        jumlahSoal: json["jumlah_soal"],
        jumlahDone: json["jumlah_done"],
    );

    Map<String, dynamic> toJson() => {
        "exercise_id": exerciseId,
        "exercise_title": exerciseTitle,
        "access_type": accessType,
        "icon": icon,
        "exercise_user_status": exerciseUserStatus,
        "jumlah_soal": jumlahSoal,
        "jumlah_done": jumlahDone,
    };
}
