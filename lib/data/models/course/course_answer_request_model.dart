// To parse this JSON data, do
//
//     final courseAnswerRequestModel = courseAnswerRequestModelFromJson(jsonString);

import 'dart:convert';

CourseAnswerRequestModel courseAnswerRequestModelFromJson(String str) =>
    CourseAnswerRequestModel.fromMap(json.decode(str));

String courseAnswerRequestModelToJson(CourseAnswerRequestModel data) =>
    json.encode(data.toMap());

class CourseAnswerRequestModel {
  String? userEmail;
  String? exerciseId;
  List<String>? bankQuestionId;
  List<String>? studentAnswer;

  CourseAnswerRequestModel({
    this.userEmail,
    this.exerciseId,
    this.bankQuestionId,
    this.studentAnswer,
  });

  factory CourseAnswerRequestModel.fromMap(Map<String, dynamic> json) =>
      CourseAnswerRequestModel(
        userEmail: json["user_email"],
        exerciseId: json["exercise_id"],
        bankQuestionId: json["bank_question_id"] == null
            ? []
            : List<String>.from(json["bank_question_id"]!.map((x) => x)),
        studentAnswer: json["student_answer"] == null
            ? []
            : List<String>.from(json["student_answer"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "user_email": userEmail,
        "exercise_id": exerciseId,
        "bank_question_id": bankQuestionId == null
            ? []
            : List<dynamic>.from(bankQuestionId!.map((x) => x)),
        "student_answer": studentAnswer == null
            ? []
            : List<dynamic>.from(studentAnswer!.map((x) => x)),
      };
}
