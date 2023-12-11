class CourseExerciseResponseEntity {
    int status;
    String message;
    List<CourseExerciseDataEntity> data;

    CourseExerciseResponseEntity({
        required this.status,
        required this.message,
        required this.data,
    });

}

class CourseExerciseDataEntity {
    String exerciseId;
    String exerciseTitle;
    String accessType;
    String icon;
    String exerciseUserStatus;
    String jumlahSoal;
    int jumlahDone;

    CourseExerciseDataEntity({
        required this.exerciseId,
        required this.exerciseTitle,
        required this.accessType,
        required this.icon,
        required this.exerciseUserStatus,
        required this.jumlahSoal,
        required this.jumlahDone,
    });

}
