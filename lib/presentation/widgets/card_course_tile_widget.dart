import 'package:application_edspert/core/themes/app_colors.dart';
import 'package:application_edspert/core/themes/app_fonts.dart';
import 'package:application_edspert/core/themes/app_grayscale.dart';
import 'package:application_edspert/domain/entity/course/course_response_entity.dart';
import 'package:application_edspert/presentation/bloc/course/exercise/exercise_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CardCourseTileWidget extends StatelessWidget {
  final CourseDataEntity course;
  const CardCourseTileWidget({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ExerciseBloc>().add(
              GetExerciseByCourseIdEvent(courseId: course.courseId),
            );
        context.push(
          '/exercise',
          extra: course.courseName,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: 50.w,
                decoration: const BoxDecoration(
                  color: AppGrayscale.input,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Image.network(
                  course.urlCover,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Text(
                      'No IMG',
                      style: AppFonts.appFont.bodyLarge,
                    );
                  },
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.courseName,
                      style: AppFonts.appFont.titleMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${course.jumlahDone}/${course.jumlahMateri} Paket latihan soal',
                      style: AppFonts.appFont.bodyMedium,
                    ),
                    SizedBox(height: 12.h),
                    SizedBox(
                      height: 4.h,
                      child: LinearProgressIndicator(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        value: course.progress / 100,
                        color: AppColors.primary,
                        backgroundColor: AppGrayscale.placeholder,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
