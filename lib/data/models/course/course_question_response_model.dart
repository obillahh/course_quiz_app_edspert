class CourseQuestionResponseModel {
  int? status;
  String? message;
  List<CourseQuestionDataModel>? data;

  CourseQuestionResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory CourseQuestionResponseModel.fromJson(Map<String, dynamic> json) =>
      CourseQuestionResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<CourseQuestionDataModel>.from(
                json["data"]!.map((x) => CourseQuestionDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CourseQuestionDataModel {
  String? exerciseIdFk;
  String? bankQuestionId;
  String? questionTitle;
  dynamic questionTitleImg;
  String? optionA;
  dynamic optionAImg;
  String? optionB;
  dynamic optionBImg;
  String? optionC;
  dynamic optionCImg;
  String? optionD;
  dynamic optionDImg;
  String? optionE;
  dynamic optionEImg;
  String? studentAnswer;

  CourseQuestionDataModel({
    this.exerciseIdFk,
    this.bankQuestionId,
    this.questionTitle,
    this.questionTitleImg,
    this.optionA,
    this.optionAImg,
    this.optionB,
    this.optionBImg,
    this.optionC,
    this.optionCImg,
    this.optionD,
    this.optionDImg,
    this.optionE,
    this.optionEImg,
    this.studentAnswer,
  });

  factory CourseQuestionDataModel.fromJson(Map<String, dynamic> json) =>
      CourseQuestionDataModel(
        exerciseIdFk: json["exercise_id_fk"],
        bankQuestionId: json["bank_question_id"],
        questionTitle: json["question_title"],
        questionTitleImg: json["question_title_img"],
        optionA: json["option_a"],
        optionAImg: json["option_a_img"],
        optionB: json["option_b"],
        optionBImg: json["option_b_img"],
        optionC: json["option_c"],
        optionCImg: json["option_c_img"],
        optionD: json["option_d"],
        optionDImg: json["option_d_img"],
        optionE: json["option_e"],
        optionEImg: json["option_e_img"],
        studentAnswer: json["student_answer"],
      );

  Map<String, dynamic> toJson() => {
        "exercise_id_fk": exerciseIdFk,
        "bank_question_id": bankQuestionId,
        "question_title": questionTitle,
        "question_title_img": questionTitleImg,
        "option_a": optionA,
        "option_a_img": optionAImg,
        "option_b": optionB,
        "option_b_img": optionBImg,
        "option_c": optionC,
        "option_c_img": optionCImg,
        "option_d": optionD,
        "option_d_img": optionDImg,
        "option_e": optionE,
        "option_e_img": optionEImg,
        "student_answer": studentAnswer,
      };
}
