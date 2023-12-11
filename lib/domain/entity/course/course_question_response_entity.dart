class CourseQuestionResponseEntity {
    int status;
    String message;
    List<CourseQuestionDataEntity> data;

    CourseQuestionResponseEntity({
        required this.status,
        required this.message,
        required this.data,
    });

}

class CourseQuestionDataEntity {
    String exerciseIdFk;
    String bankQuestionId;
    String questionTitle;
    dynamic questionTitleImg;
    String optionA;
    dynamic optionAImg;
    String optionB;
    dynamic optionBImg;
    String optionC;
    dynamic optionCImg;
    String optionD;
    dynamic optionDImg;
    String optionE;
    dynamic optionEImg;
    String studentAnswer;

    CourseQuestionDataEntity({
        required this.exerciseIdFk,
        required this.bankQuestionId,
        required this.questionTitle,
        required this.questionTitleImg,
        required this.optionA,
        required this.optionAImg,
        required this.optionB,
        required this.optionBImg,
        required this.optionC,
        required this.optionCImg,
        required this.optionD,
        required this.optionDImg,
        required this.optionE,
        required this.optionEImg,
        required this.studentAnswer,
    });

}
