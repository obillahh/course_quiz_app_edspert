import 'package:application_edspert/core/themes/app_fonts.dart';
import 'package:application_edspert/core/themes/app_grayscale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/themes/app_colors.dart';
import '../../domain/entity/course/course_result_response_entity.dart';
import '../bloc/course/result/result_bloc.dart';

class CourseResultPage extends StatelessWidget {
  const CourseResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/home');
          },
          icon: const Icon(Icons.close),
        ),
        elevation: 0,
        backgroundColor: AppColors.primary,
        title: const Text('Tutup'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Selamat',
              style: AppFonts.appFont.headlineSmall!.copyWith(
                color: AppGrayscale.off,
              ),
            ),
            Text(
              'Kamu telah menyelesaikan Quiz ini',
              style: AppFonts.appFont.bodyMedium!.copyWith(
                color: AppGrayscale.off,
              ),
            ),
            SizedBox(height: 20.h),
            Image.asset(
              'assets/images/result.png',
              width: 200.w,
            ),
            SizedBox(height: 20.h),
            Text(
              'Nilai Kamu',
              style: AppFonts.appFont.titleSmall!.copyWith(
                color: AppGrayscale.off,
              ),
            ),
            SizedBox(height: 80.h),
            BlocBuilder<ResultBloc, ResultState>(
              builder: (context, state) {
                if (state is ResultSuccess) {
                  return Text(
                    state.courseResult.result.jumlahScore,
                    style: AppFonts.appFont.headlineLarge!.copyWith(
                      color: AppGrayscale.off,
                      fontSize: 60.sp,
                    ),
                  );
                }
                if (state is ResultFail) {
                  return Text(state.message);
                }
                return const CircularProgressIndicator(
                  color: AppGrayscale.off,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
