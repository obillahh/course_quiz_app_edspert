import 'package:application_edspert/domain/entity/course/course_exercise_response_entity.dart';
import 'package:application_edspert/presentation/bloc/course/question/question_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/themes/app_fonts.dart';
import '../../core/themes/app_grayscale.dart';

class CardCourseExerciseWidget extends StatelessWidget {
  final CourseExerciseDataEntity courseExercise;
  const CardCourseExerciseWidget({super.key, required this.courseExercise});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<QuestionBloc>().add(GetQuestionByExerciseIdEvent(
            exerciseId: courseExercise.exerciseId));
        context.push('/question');
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                width: 46.w,
                decoration: const BoxDecoration(
                  color: AppGrayscale.input,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Image.network(
                  courseExercise.icon,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Text(
                      'No IMG',
                      style: AppFonts.appFont.bodySmall!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                courseExercise.exerciseTitle,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: AppFonts.appFont.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${courseExercise.jumlahDone}/${courseExercise.jumlahSoal} Soal',
                style: AppFonts.appFont.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
