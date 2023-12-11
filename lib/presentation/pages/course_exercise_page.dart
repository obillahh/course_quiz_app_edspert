import 'package:application_edspert/presentation/bloc/course/exercise/exercise_bloc.dart';
import 'package:application_edspert/presentation/widgets/card_course_exercise_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/themes/app_colors.dart';
import '../../core/themes/app_fonts.dart';
import '../../core/themes/app_grayscale.dart';

class CourseExercisePage extends StatelessWidget {
  final String courseTitle;
  const CourseExercisePage({super.key, required this.courseTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppGrayscale.bg,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text(
          courseTitle,
          style: AppFonts.appFont.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pilih Paket Soal',
                style: AppFonts.appFont.headlineSmall,
              ),
              SizedBox(height: 16.h),
              BlocBuilder<ExerciseBloc, ExerciseState>(
                builder: (context, state) {
                  if (state is CourseExerciseSuccess) {
                    if (state.courseExercises!.isEmpty) {
                      return SizedBox(
                        height: 460.h,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/empty_exercise.svg',
                            ),
                            Text(
                              'Yah, Paket tidak tersedia',
                              textAlign: TextAlign.center,
                              style: AppFonts.appFont.titleLarge!.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              "Tenang, masih banyak yang bisa kamu pelajari.\n Cari lagi yuk!",
                              textAlign: TextAlign.center,
                              style: AppFonts.appFont.bodySmall!.copyWith(
                                color: AppGrayscale.label,
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                        ),
                        itemCount: state.courseExercises!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CardCourseExerciseWidget(
                            courseExercise: state.courseExercises![index],
                          );
                        },
                      );
                    }
                  } else if (state is CourseExerciseLoading) {
                    return SizedBox(
                      height: 480.h,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    // Handle other states (CourseExerciseInitial, CourseExerciseError, etc.) if needed
                    return const Expanded(
                      child: Center(
                        child: Text('Unhandled state'),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
