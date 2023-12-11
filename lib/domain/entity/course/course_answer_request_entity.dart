class CourseAnswerRequestEntity {
  List<String> bankQuestionId;
  List<String> studentAnswer;

  CourseAnswerRequestEntity({
    required this.bankQuestionId,
    required this.studentAnswer,
  });
}
