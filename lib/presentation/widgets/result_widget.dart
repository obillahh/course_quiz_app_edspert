import 'package:flutter/material.dart';

import '../../core/themes/app_fonts.dart';
import '../../core/themes/app_grayscale.dart';
import '../../domain/entity/course/course_result_response_entity.dart';

class ResultWidget extends StatelessWidget {
  final CourseResultResponseEntity result;
  const ResultWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Text(
      result.data.result.jumlahScore,
      style: AppFonts.appFont.headlineMedium!.copyWith(
        color: AppGrayscale.off,
      ),
    );
  }
}
