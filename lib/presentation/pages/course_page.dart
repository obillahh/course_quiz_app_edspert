import 'package:application_edspert/core/themes/app_fonts.dart';
import 'package:application_edspert/presentation/widgets/card_course_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/themes/app_colors.dart';
import '../../core/themes/app_grayscale.dart';
import '../bloc/course/course_bloc.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppGrayscale.bg,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text(
          'Pilih Pelajaran',
          style: AppFonts.appFont.headlineSmall,
        ),
      ),
      body: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          if (state is CourseSuccess) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return CardCourseTileWidget(course: state.courses![index]);
                },
                separatorBuilder: (context, index) => SizedBox(height: 6.h),
                itemCount: state.courses!.length,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
