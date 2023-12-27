import 'dart:developer';

import 'package:flutter/material.dart';

import '../../core/themes/app_fonts.dart';
import '../../core/themes/app_grayscale.dart';
import '../../domain/entity/course/course_result_response_entity.dart';

class CourseResultWidget extends StatelessWidget {
  final CourseResultDataEntity data;
  const CourseResultWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    inspect(data.result.jumlahScore);
    return Text(
      data.result.jumlahScore,
      style: AppFonts.appFont.headlineMedium!.copyWith(
        color: AppGrayscale.off,
      ),
    );
  }
}
